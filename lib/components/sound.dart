import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Sound {
  Sound(
      {required this.link,
      required this.icon,
      this.currentSoundVolume = 0.5,
      this.isSoundPlayNow = false});

  String link;
  IconData icon;
  double currentSoundVolume;
  bool isSoundPlayNow;

  final player = AudioPlayer();

  void playSound() async {
    await player.setSource(
      AssetSource(link),
    );
    if (isSoundPlayNow) {
      await player.resume();
    } else {
      await player.stop();
    }
  }

  void setVolume() {
    player.setVolume(currentSoundVolume);
  }
}
