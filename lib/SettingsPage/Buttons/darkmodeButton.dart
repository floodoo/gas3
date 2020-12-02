import 'package:flutter/material.dart';

class DarkModeButton extends StatefulWidget {
  @override
  _DarkModeButtonState createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text("Darkmode ?"),
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