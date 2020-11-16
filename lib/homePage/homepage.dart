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
      });
    });
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
        player.resume();
        break;
      case AppLifecycleState.inactive:
        player.pause();
        break;
      case AppLifecycleState.paused:
        player.pause();
        break;
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
