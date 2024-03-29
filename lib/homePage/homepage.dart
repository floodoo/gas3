import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas3/homePage/kmhTextDisplay.dart';
import 'package:gas3/homePage/kmhTextShaker.dart';
import 'package:gas3/homePage/music.dart';
import 'package:gas3/homePage/noMusicDialog.dart';
import 'package:gas3/homePage/speedometer.dart';
import 'package:gas3/homePage/speedometerShaker.dart';
import 'package:gas3/SettingsPage/settingsPage.dart';
import 'package:gas3/highscore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool shake;
  double speedInMps;
  double speedInKmh;
  String speedInKmhString;
  var geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  bool music = false;
  var icon = Icons.music_off;
  double highscore;
  String loadFile;

  addHighscoreToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("highscore", highscore);
  }

  getHighscoreFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    highscore = prefs.getDouble("highscore");
    if (highscore == null) {
      highscore = 0.0;
    }
  }

  Future<void> getVehicleSpeed() async {
    Geolocator.getPositionStream().listen((position) async {
      speedInMps = position.speed;
      setState(() {
        speedInKmh = speedInMps * 3.6;
        speedInKmhString = speedInKmh.toStringAsFixed(0);

        if (highscore != null) {
          if (speedInKmh > highscore) {
            highscore = speedInKmh;
            addHighscoreToSP();
          }
        }
        if (speedInKmh == null) {
          speedInKmh = 0;
        }
        if (music == true) {
          Music.instance.player
              .setPlaybackRate(playbackRate: audioSpeed(speedInKmh));
        }
        if (speedInKmh >= 140) {
          shake = true;
        } else {
          shake = false;
        }
      });
    });
  }

  audioSpeed(speedInKmh) {
    if (speedInKmh == null) {
      return 0.5;
    } else if (speedInKmh <= 5) {
      return 0.5;
    } else if (speedInKmh <= 10) {
      return 0.6;
    } else if (speedInKmh <= 30) {
      return 0.7;
    } else if (speedInKmh <= 50) {
      return 0.8;
    } else if (speedInKmh <= 70) {
      return 0.9;
    } else if (speedInKmh <= 100) {
      return 1.0;
    } else if (speedInKmh <= 110) {
      return 1.1;
    } else if (speedInKmh <= 120) {
      return 1.2;
    } else if (speedInKmh <= 130) {
      return 1.3;
    } else if (speedInKmh <= 140) {
      return 1.4;
    } else if (speedInKmh <= 150) {
      return 1.5;
    } else if (speedInKmh <= 160) {
      return 1.6;
    } else if (speedInKmh >= 170) {
      return 1.7;
    }
  }

  @override
  void initState() {
    super.initState();
    getHighscoreFromSP();
    getStringValuesSF();
    WidgetsBinding.instance.addObserver(this);
    getVehicleSpeed();
    Screen.keepOn(true);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black));
    shake = false;
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loadFile = prefs.getString('audioFile');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: () {
              music = false;
              icon = Icons.music_off;
              Music.instance.stopLoop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Highscore()),
              );
            }),
        title: Text("Gas³"),
        centerTitle: true,
        backgroundColor: Colors.black54,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(icon),
              onPressed: () async {
                if (music == true) {
                  music = false;
                  Music.instance.stopLoop();
                  icon = Icons.music_off;
                } else {
                  if (loadFile != null) {
                    music = true;
                    Music.instance.playLoop();
                    icon = Icons.music_note;
                  } else {
                    music = false;
                    String returnVal = await showDialog(
                        context: context, builder: (_) => NoMusicDialog());
                    icon = Icons.music_off;
                    if (returnVal == "success") {
                      getStringValuesSF();
                    }
                  }
                }
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                music = false;
                icon = Icons.music_off;
                Music.instance.stopLoop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              })
        ],
      ),
      body: Container(
        color: Colors.black54,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: shake
                    ? SpeedometerShaker(speedInKmh)
                    : Speedometer(speedInKmh),
              ),
            ),
            Center(
                child: shake
                    ? KmhTextShaker(speedInKmh, speedInKmhString)
                    : KmhTextDisplay(speedInKmh, speedInKmhString))
          ],
        ),
      ),
    );
  }
}
