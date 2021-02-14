import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AreYouSureDialog extends StatelessWidget {
  final double highscore = 0;

  addHighscoreToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("highscore", highscore);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("Do you really want to delete the highscore?"),
      actions: [
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text("Delete"),
          onPressed: () {
            addHighscoreToSP();
            Navigator.of(context).pop(true);
            
          },
        )
      ],
    );
  }
}
