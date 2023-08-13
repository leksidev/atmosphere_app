import 'package:atmosphere/data/sound_repository.dart';
import 'package:atmosphere/widgets/sound_button.dart';
import 'package:flutter/material.dart';
import 'sound_item.dart';

class Playlist extends ChangeNotifier {
  List<SoundItem> mutedSounds = SoundRepository(content).getSoundsData();

  List<SoundItem> playedSounds = [];

  void addToPlaylist(SoundItem sound) {
    if (sound.isActive == true) {
      playedSounds.add(sound);
      sound.played = true;
      notifyListeners();
    } else {
      deleteFromPlaylist(sound);
    }
  }

  void deleteFromPlaylist(SoundItem sound) {
    playedSounds.remove(sound);
    sound.played = false;
    notifyListeners();
  }

  void pausePlaylist() {
    for (SoundItem sound in playedSounds) {
      sound.pauseSound();
    }
  }

  void changeVolume(SoundItem sound, double volume) {
    sound.setVolume(volume);
    notifyListeners();
  }

  void resumePlaylist() {
    for (SoundItem sound in playedSounds) {
      sound.playSound();
    }
  }

  List<Widget> get mutedSoundsButtons {
    List<SoundItem> soundsList = mutedSounds;
    final wiggetsList = <Widget>[];
    for (SoundItem sound in soundsList) {
      wiggetsList.add(
        SoundButton(sound: sound),
      );
    }
    return wiggetsList;
  }

  List<Widget> get playedSoundsButtons {
    List<SoundItem> soundsList = playedSounds;
    final wiggetsList = <Widget>[];
    for (SoundItem sound in soundsList) {
      wiggetsList.add(
        SoundButton(sound: sound),
      );
    }
    return wiggetsList;
  }
}
