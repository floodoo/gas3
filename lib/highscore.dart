import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gas3/areYouSureDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Highscore extends StatefulWidget {
  @override
  _HighscoreState createState() => _HighscoreState();
}

class _HighscoreState extends State<Highscore> {
  bool _isLoading = true;
  double highscore;

  getHighscoreFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    highscore = prefs.getDouble("highscore");
    if (highscore == null) {
      highscore = 0.0;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getHighscoreFromSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Highscore"),
        centerTitle: true,
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () async {
              var result = await showDialog(
                  context: context, builder: (_) => AreYouSureDialog());
              if (result == true) {
                setState(() {
                  getHighscoreFromSP();
                });
              }
            },
          )
        ],
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: _isLoading
              ? AutoSizeText(
                  "Loading...",
                  style: TextStyle(fontSize: 200, color: Colors.white),
                  maxLines: 1,
                )
              : AutoSizeText(
                  highscore.toStringAsFixed(0),
                  style: TextStyle(fontSize: 200, color: Colors.white),
                  maxLines: 1,
                ),
        ),
      ),
    );
  }
}
