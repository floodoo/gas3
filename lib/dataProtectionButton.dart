import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataProtectionButton extends StatelessWidget {
  _launchURL() async {
    const url ="";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.text_snippet),
          title: Text("Data Protection"),
          trailing: Icon(Icons.open_in_new),
          onTap: _launchURL,
        ),
      ),
    );
  }
}
