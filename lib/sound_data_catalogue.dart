import 'package:atmosphere/models/sound.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const kIconSize = 60.0;

Map<String, Sound> catalogueSounds = {
  'Storm': Sound(
      link: 'audio/data_resources_sounds_storm.ogg',
      icon: WeatherIcons.storm_showers,
      image: Image.asset(
        'assets/img/icons8-thunderstorm.png',
      )),
  'Birds': Sound(
    link: 'audio/data_resources_sounds_birds.ogg',
    icon: Icons.music_note,
    image: Image.asset('assets/img/icons8-birds.png'),
  ),
  'City': Sound(
    link: 'audio/data_resources_sounds_city.ogg',
    icon: Icons.location_city,
    image: Image.asset('assets/img/icons8-city.png'),
  ),
  'Coffee-shop': Sound(
    link: 'audio/data_resources_sounds_coffee-shop.ogg',
    icon: Icons.coffee_maker,
    image: Image.asset('assets/img/icons8-coffee-shop.png'),
  ),
  'Fireplace': Sound(
    link: 'audio/data_resources_sounds_fireplace.ogg',
    icon: Icons.fireplace,
    image: Image.asset('assets/img/icons8-fire.png'),
  ),
  'Wind': Sound(
    link: 'audio/data_resources_sounds_wind.ogg',
    icon: WeatherIcons.wind_direction,
    image: Image.asset('assets/img/icons8-wind.png'),
  ),
  'Train': Sound(
    link: 'audio/data_resources_sounds_train.ogg',
    icon: Icons.train,
    image: Image.asset('assets/img/icons8-train.png'),
  ),
  'Summer night': Sound(
    link: 'audio/data_resources_sounds_summer-night.ogg',
    icon: WeatherIcons.night_alt_lightning,
    image: Image.asset('assets/img/icons8-half-moon.png'),
  ),
  'Waves': Sound(
    link: 'audio/data_resources_sounds_waves.ogg',
    icon: Icons.waves,
    image: Image.asset('assets/img/icons8-waves.png'),
  ),
};
