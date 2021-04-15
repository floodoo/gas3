import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Music {
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  String filePath;
  String loadFile;

  Music._privateConstructor() {
    this.player.setVolume(1.0);
  }

  static final Music instance = Music._privateConstructor();

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('audioFile', filePath);
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loadFile = prefs.getString('audioFile');
    player.stop();
    player.play(loadFile, isLocal: true);
    // player = await cache.loop(filePath);
  }

  Future playLoop() async {
    getStringValuesSF();
  }

  void stopLoop() {
    player?.stop();
  }

  getMusic(FilePickerResult result) async {

    if (result != null) {
      File file = File(result.files.single.path);
      filePath = file.path;
      addStringToSF();
    } else {
      print("Canceled");
    }
  }
}
