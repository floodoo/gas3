import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas3/SettingsPage/Buttons/firework.dart';

class AppVersionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text("App Version"),
          trailing: Text("1.0.0"),
          onTap: () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                systemNavigationBarColor: Colors.black));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Firework()),
            );
          },
        ),
      ),
    );
  }
}
