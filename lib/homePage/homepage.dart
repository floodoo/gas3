import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas3/homePage/kmhTextDisplay.dart';
import 'package:gas3/homePage/speedometer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:screen/screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  double speedInMps;
  double speedInKmh;
  String speedInKmhString;
  var geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  static AudioCache cache = AudioCache();
  AudioPlayer player;

  Future<void> getVehicleSpeed() async {
    Geolocator.getPositionStream().listen((position) async {
      speedInMps = position.speed;
      setState(() {
        speedInKmh = speedInMps * 3.6;
        speedInKmhString = speedInKmh.toStringAsFixed(0);
        player.setPlaybackRate(playbackRate: audioSpeed(speedInKmh));
        if (speedInKmh == 0) {
          player.pause();
        } else {
          player.resume();
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
    } else if (speedInKmh <= 170) {
      return 1.7;
    } else if (speedInKmh <= 180) {
      return 1.8;
    } else if (speedInKmh <= 190) {
      return 1.9;
    } else if (speedInKmh >= 191) {
      return 2.0;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getVehicleSpeed();
    Screen.keepOn(true);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    play();
  }

  void play() async {
    player = await cache.loop("audio/gas.mp3");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        if (player != null) {
          player.resume();
          
        } break;
      case AppLifecycleState.inactive:
        if (player != null) {
          player.pause();
          
        } break;
      case AppLifecycleState.paused:
        if (player != null) {
          player.pause();
          
        } break;
      case AppLifecycleState.detached:
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gas³"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black54,
        child: ListView(
          children: [
            Center(
              child: Speedometer(speedInKmh),
            ),
            Center(
              child: KmhTextDisplay(speedInKmh, speedInKmhString),
            ),
          ],
        ),
      ),
    );
  }
}
