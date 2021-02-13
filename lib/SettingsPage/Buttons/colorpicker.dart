import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  var color;
  bool _isLoading = true;

  @override
  initState() {
    super.initState();
    getColorFromSP();
  }

  addColorToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("color", color);
    print("save");
  }

  getColorFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    color = prefs.getInt("color");
    if (color == null) {
      color = 0xFF000000;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Color Picker"),
          centerTitle: true,
          backgroundColor: Colors.black54),
      body: _isLoading
          ? Center(child: Text("Loading..."))
          : Container(
              color: Colors.black54,
              child: Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: ColorPicker(
                  paletteType: PaletteType.hsv,
                  pickerColor: Colors.red,
                  onColorChanged: (color) {
                    addColorToSP();
                  },
                ),
              )),
    );
  }
}
