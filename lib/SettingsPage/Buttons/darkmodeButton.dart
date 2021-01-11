import 'package:flutter/material.dart';
import 'package:gas3/SettingsPage/theme.dart';
import 'package:provider/provider.dart';

class DarkModeButton extends StatefulWidget {
  @override
  _DarkModeButtonState createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  bool isSwitched = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => ListTile(
                title: Text("Darkmode ?"),
                trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      isSwitched = value;
                      notifier.toggleTheme();
                    }),
                onTap: () {
                  if (isSwitched == true) {
                    isSwitched = false;
                  } else if (isSwitched == false) {
                    isSwitched = true;
                  }
                },
              ),
            )));
  }
}
