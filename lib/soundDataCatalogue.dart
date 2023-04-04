import 'package:atmosphere/models/sound.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const kIconSize = 60.0;

Map<String, Sound> catalogueSounds = {
  'Storm': Sound(
    link: 'audio/data_resources_sounds_storm.ogg',
    icon: WeatherIcons.storm_showers,
  ),
  'Birds': Sound(
      link: 'audio/data_resources_sounds_birds.ogg', icon: Icons.queue_music),
  'City': Sound(
      link: 'audio/data_resources_sounds_city.ogg', icon: Icons.location_city),
  'Coffee-shop': Sound(
      link: 'audio/data_resources_sounds_coffee-shop.ogg',
      icon: Icons.coffee_maker),
  'Fireplace': Sound(
      link: 'audio/data_resources_sounds_fireplace.ogg', icon: Icons.fireplace),
  'Wind': Sound(
      link: 'audio/data_resources_sounds_wind.ogg',
      icon: WeatherIcons.strong_wind),
  'Train':
      Sound(link: 'audio/data_resources_sounds_train.ogg', icon: Icons.train),
  'Summer night': Sound(
      link: 'audio/data_resources_sounds_summer-night.ogg',
      icon: WeatherIcons.night_alt_lightning),
  'Waves':
      Sound(link: 'audio/data_resources_sounds_waves.ogg', icon: Icons.waves),
};
