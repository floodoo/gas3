import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Color Picker"),
          centerTitle: true,
          backgroundColor: Colors.black54),
      body: Container(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: ColorPicker(
              paletteType: PaletteType.hsv,
              pickerColor: Colors.red,
              onColorChanged: (Color value) {},
            ),
          )),
    );
  }
}
