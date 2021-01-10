import 'package:flutter/material.dart';
import 'package:gas3/SettingsPage/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeButton extends StatefulWidget {
  @override
  _DarkModeButtonState createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  bool isSwitched = false;
  bool isSwitchedSp;
  bool _isLoading = true;

  darkmodeToSp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkmode", isSwitched);
  }

  getDarkmodeFromSp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitchedSp = prefs.getBool("darkmode");
    isSwitchedSp == null ? isSwitched = false : isSwitched = isSwitchedSp;
    setState(() {
      _isLoading = false;
    });
  }

  changeMode() {
    ThemeChanger _themeChanger =
        Provider.of<ThemeChanger>(context, listen: false);
    if (isSwitched == true) {
      isSwitched = false;
      _themeChanger.setTheme(ThemeData.light());
    } else if (isSwitched == false) {
      isSwitched = true;
      _themeChanger.setTheme(ThemeData.dark());
    }
    darkmodeToSp();
  }

  @override
  initState() {
    super.initState();
    getDarkmodeFromSp();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: _isLoading
                ? ListTile(
                    title: Text("Wird geladen..."),
                  )
                : ListTile(
                    title: Text("Darkmode ?"),
                    trailing: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            changeMode();
                          });
                        }),
                    onTap: () {
                      changeMode();
                    },
                  )));
  }
}
