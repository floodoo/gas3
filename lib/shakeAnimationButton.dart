import 'package:flutter/material.dart';

class ShakeAnimationButton extends StatefulWidget {
  @override
  _ShakeAnimationButtonState createState() => _ShakeAnimationButtonState();
}

class _ShakeAnimationButtonState extends State<ShakeAnimationButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text("Animation ?"),
          trailing: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              }),
          onTap: () {setState(() {
                  if (isSwitched == true) {
                    isSwitched = false;
                  } else if (isSwitched == false) {
                    isSwitched = true;
                  }
                });},
        ),
      ),
    );
  }
}
