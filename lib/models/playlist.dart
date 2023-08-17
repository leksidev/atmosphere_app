import 'package:atmosphere/data/sound_repository.dart';
import 'package:atmosphere/features/sounds_screen/view/widgets/sound_button.dart';
import 'package:atmosphere/handlers/audio_handler.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'sound_item.dart';

class Playlist extends ChangeNotifier {
  List<SoundItem> mutedSounds = SoundRepository(content).getSoundsData();

  List<SoundItem> playedSounds = [];

  void addToPlaylist(SoundItem sound) {
    if (sound.isActive == true) {
      playedSounds.add(sound);
      sound.played = true;
      GetIt.I<MyAudioHandler>().play();
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

  void changeVolume(SoundItem sound, double volume) {
    sound.setVolume(volume);
    notifyListeners();
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
    final widgetsList = <Widget>[];
    for (SoundItem sound in soundsList) {
      widgetsList.add(
        SoundButton(sound: sound),
      );
    }
    return widgetsList;
  }
}
