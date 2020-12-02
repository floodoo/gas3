import 'package:flutter/material.dart';
import 'package:gas3/SettingsPage/Buttons/appVersionButton.dart';
import 'package:gas3/SettingsPage/Buttons/colorPickerButton.dart';
import 'package:gas3/SettingsPage/Buttons/darkmodeButton.dart';
import 'package:gas3/SettingsPage/Buttons/dataProtectionButton.dart';
import 'package:gas3/homePage/homepage.dart';
import 'package:gas3/SettingsPage/Buttons/muteButton.dart';
import 'package:gas3/SettingsPage/Buttons/shakeAnimationButton.dart';
import 'package:logger/logger.dart';

class SettingsPage extends StatelessWidget {
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
        ),
        body: Container(
            color: Colors.black54,
            child: ListView(children: [
              Column(
                children: [
                  MuteButton(),
                  ShakeAnimationButton(),
                  DarkModeButton(),
                  ColorPickerButton(),
                  AppVersionButton(),
                  DataProtectionButton(),
                ],
              ),
            ])));
  }
}
