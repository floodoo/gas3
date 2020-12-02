import 'package:flutter/material.dart';

class MuteButton extends StatefulWidget {
  @override
  _MuteButtonState createState() => _MuteButtonState();
}

class _MuteButtonState extends State<MuteButton> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text("Music ?"),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
              onTap: () {
                setState(() {
                  if (isSwitched == true) {
                    isSwitched = false;
                  } else if (isSwitched == false) {
                    isSwitched = true;
                  }
                });
              },
            )));
  }
}
