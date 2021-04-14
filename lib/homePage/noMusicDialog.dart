import 'package:flutter/material.dart';
import 'package:gas3/homePage/music.dart';

class NoMusicDialog extends StatelessWidget {
  final double highscore = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text(
          "There is no music stored. Select some now or do this in the settings."),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Select Music"),
          onPressed: () {
            Music.instance.getMusic();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
