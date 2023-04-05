import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Sound {
  Sound(
      {required this.link,
      required this.icon,
      required this.image,
      this.currentSoundVolume = 0.5,
      this.isSoundPlayNow = false});

  String link;
  IconData icon;
  Image image;
  double currentSoundVolume;
  bool isSoundPlayNow;

  final player = AudioPlayer();

  void playbackControl() async {
    isSoundPlayNow = !isSoundPlayNow;
    if (isSoundPlayNow) {
      await player.setSource(
        AssetSource(link),
      );
      await player.setReleaseMode(ReleaseMode.loop);
      await player.resume();
    } else {
      await player.stop();
    }
  }

  void setVolume() {
    player.setVolume(currentSoundVolume);
  }
}
