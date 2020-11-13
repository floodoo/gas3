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

class _HomePageState extends State<HomePage> {
  double speedInMps;
  double speedInKmh;
  String speedInKmhString;
  var geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

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
    getVehicleSpeed();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gas³"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Speedometer(speedInKmh),
              KmhTextDisplay(speedInKmh, speedInKmhString),
            ],
          ),
        ),
      ),
    );
  }
}
