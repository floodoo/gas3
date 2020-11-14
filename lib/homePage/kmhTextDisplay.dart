import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KmhTextDisplay extends StatefulWidget {
  final double speedInKmh;
  final String speedInKmhString;

  const KmhTextDisplay(this.speedInKmh, this.speedInKmhString);

  @override
  _KmhTextDisplayState createState() => _KmhTextDisplayState();
}

class _KmhTextDisplayState extends State<KmhTextDisplay> {
  textSize(speedInKmh) {
    if (speedInKmh == null) {
      return 30.0;
    } else if (speedInKmh <= 10) {
      return 30.0;
    } else if (speedInKmh <= 30) {
      return 50.0;
    } else if (speedInKmh <= 50) {
      return 70.0;
    } else if (speedInKmh <= 70) {
      return 100.0;
    } else if (speedInKmh <= 100) {
      return 140.0;
    } else if (speedInKmh <= 110) {
      return 180.0;
    } else if (speedInKmh <= 120) {
      return 200.0;
    } else if (speedInKmh <= 130) {
      return 230.0;
    } else if (speedInKmh <= 140) {
      return 240.0;
    } else if (speedInKmh <= 150) {
      return 250.0;
    } else if (speedInKmh <= 160) {
      return 260.0;
    } else if (speedInKmh <= 170) {
      return 270.0;
    } else if (speedInKmh <= 180) {
      return 280.0;
    } else if (speedInKmh <= 190) {
      return 290.0;
    } else if (speedInKmh <= 200) {
      return 200.0;
    } else if (speedInKmh <= 210) {
      return 210.0;
    } else if (speedInKmh <= 220) {
      return 220.0;
    } else if (speedInKmh <= 230) {
      return 230.0;
    } else if (speedInKmh <= 240) {
      return 240.0;
    } else if (speedInKmh <= 250) {
      return 250.0;
    } else if (speedInKmh <= 260) {
      return 260.0;
    } else if (speedInKmh <= 270) {
      return 270.0;
    } else if (speedInKmh <= 280) {
      return 280.0;
    } else if (speedInKmh <= 290) {
      return 290.0;
    } else if (speedInKmh <= 300) {
      return 300.0;
    } else if (speedInKmh >= 301) {
      return 320.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var speedInKmhString = widget.speedInKmhString;
    var speedInKmh = widget.speedInKmh;
    return Expanded(
      child: AutoSizeText(
        speedInKmh == null ? "0" : "$speedInKmhString",
        style: TextStyle(fontSize: textSize(speedInKmh), color: Colors.white),
        maxLines: 1,
      ),
    );
  }
}
