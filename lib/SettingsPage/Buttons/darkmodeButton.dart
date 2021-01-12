import 'package:flutter/material.dart';
import 'package:gas3/SettingsPage/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeButton extends StatefulWidget {
  @override
  _DarkModeButtonState createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  bool isSwitched = true;
  bool _isLoading = true;

  @override
  initState() {
    super.initState();
    getBoolFromSP();
  }

  addBoolToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkmode", isSwitched);
  }

  getBoolFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitched = prefs.getBool("darkmode");
    if (isSwitched == null) {
      isSwitched = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: _isLoading
            ? Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text("Loading..."),
                ),
              )
            : Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => ListTile(
                    title: Text("Darkmode ?"),
                    trailing: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          isSwitched = value;
                          notifier.toggleTheme();
                          addBoolToSP();
                        }),
                    onTap: () {
                      if (isSwitched == true) {
                        isSwitched = false;
                      } else if (isSwitched == false) {
                        isSwitched = true;
                      }
                      notifier.toggleTheme();
                      addBoolToSP();
                    },
                  ),
                )));
  }
}
