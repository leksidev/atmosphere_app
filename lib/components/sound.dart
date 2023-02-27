import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Sound {
  Sound({required this.link, required this.icon});

  String link;
  IconData icon;
  double currentSoundVolume = 0.5;
  bool isSoundPlayNow = false;

  final player = AudioPlayer();

  void playSound(link, isSoundPlayNov) async {
    await player.setSource(
      AssetSource(link),
    );
    if (isSoundPlayNow) {
      await player.resume();
    } else {
      await player.stop();
    }
  }
}
