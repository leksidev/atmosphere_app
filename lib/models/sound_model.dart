import 'dart:collection';

import 'package:atmosphere/models/sound.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class SoundModel extends ChangeNotifier {
  final Map<String, Sound> _soundsList = {
    'Storm': Sound(
        link: 'audio/data_resources_sounds_storm.ogg',
        icon: WeatherIcons.storm_showers,
        image: Image.asset(
          'assets/img/icons8-default.png',
        )),
    'Birds': Sound(
      link: 'audio/data_resources_sounds_birds.ogg',
      icon: Icons.music_note,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'City': Sound(
      link: 'audio/data_resources_sounds_city.ogg',
      icon: Icons.location_city,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Coffee-shop': Sound(
      link: 'audio/data_resources_sounds_coffee-shop.ogg',
      icon: Icons.coffee_maker,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Fireplace': Sound(
      link: 'audio/data_resources_sounds_fireplace.ogg',
      icon: Icons.fireplace,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Wind': Sound(
      link: 'audio/data_resources_sounds_wind.ogg',
      icon: WeatherIcons.wind_direction,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Train': Sound(
      link: 'audio/data_resources_sounds_train.ogg',
      icon: Icons.train,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Summer night': Sound(
      link: 'audio/data_resources_sounds_summer-night.ogg',
      icon: WeatherIcons.night_alt_lightning,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
    'Waves': Sound(
      link: 'audio/data_resources_sounds_waves.ogg',
      icon: Icons.waves,
      image: Image.asset('assets/img/icons8-default.png'),
    ),
  };

  UnmodifiableListView<Sound> get soundsList =>
      UnmodifiableListView(_soundsList as Iterable<Sound>);

  // SoundModel(this._catalogueSounds);

  void togglePlaybackControl(String soundName) {
    _soundsList[soundName]?.playbackControl();
    notifyListeners();
  }

  void setVolume(String soundName, double value) {
    _soundsList[soundName]!.currentSoundVolume = value;
    _soundsList[soundName]!.setVolume();
    notifyListeners();
  }

  bool isSoundPlayNow(String soundName) =>
      _soundsList[soundName]!.isSoundPlayNow;

  double currentSoundVolume(String soundName) =>
      _soundsList[soundName]!.currentSoundVolume;
}
