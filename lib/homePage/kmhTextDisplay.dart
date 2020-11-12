import 'package:flutter/material.dart';

class KmhTextDisplay extends StatefulWidget {
  final double speedInKmh;
  final String speedInKmhString;

  const KmhTextDisplay(this.speedInKmh, this.speedInKmhString);

  @override
  _KmhTextDisplayState createState() => _KmhTextDisplayState();
}

class _KmhTextDisplayState extends State<KmhTextDisplay> {
  @override
  Widget build(BuildContext context) {
    var speedInKmhString = widget.speedInKmhString;
    var speedInKmh = widget.speedInKmh;
    return Text(
      speedInKmh == null ? "0" : "$speedInKmhString",
      style: TextStyle(fontSize: 70, color: Colors.white),
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
  }
}
