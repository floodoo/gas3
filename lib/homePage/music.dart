import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Music {
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  String filePath = "audio/gas.mp3";

  Music._privateConstructor() {
    this.player.setVolume(1.0);
  }

  static final Music instance = Music._privateConstructor();

  Future playLoop() async {
    player.stop();
    player = await cache.loop(filePath);
  }

  void stopLoop() {
    player?.stop();
  }
}
