import 'package:flutter/material.dart';

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
          trailing: Text("0.1.5"),
        ),
      ),
    );
  }
}
