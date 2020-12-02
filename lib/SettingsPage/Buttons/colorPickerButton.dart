import 'package:flutter/material.dart';

class ColorPickerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text("Colorpicker"),
              trailing: Icon(Icons.colorize),
              onTap: () {},
            )));
  }
}
