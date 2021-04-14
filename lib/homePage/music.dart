import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Music {
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  String filePath;
  bool isMusic = false;

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
    filePath = prefs.getString('audioFile');
  }

  Future playLoop() async {
    getStringValuesSF();
    player.stop();
    if (filePath != null) {
      player.play(filePath, isLocal: true);
      // player = await cache.loop(filePath);
    }
  }

  void stopLoop() {
    player?.stop();
  }

  getMusic() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null) {
      File file = File(result.files.single.path);
      filePath = file.path;
      addStringToSF();
      isMusic = true;
    } else {
      isMusic = false;
    }
    return isMusic;
  }
}
