import 'dart:convert';

import 'package:atmosphere/features/sounds_screen/view/widgets/sound_button.dart';
import 'package:atmosphere/models/sound_item.dart';
import 'package:flutter/material.dart';

const content = '''
[
    [
        {
            "title": "Storm"
        ,

            "link": "assets/audio/data_resources_sounds_storm.ogg"
        ,

            "icon": "WeatherIcons.storm_showers"
        ,

            "image": "assets/img/icons8-thunderstorm.png"
        }
    ],
    [
        {
            "title": "Birds"
        ,
            "link": "assets/audio/data_resources_sounds_birds.ogg"
        ,
            "icon": "Icons.music_note"
        ,
            "image": "assets/img/icons8-birds.png"
        }
    ],
    [
        {
            "title": "Coffee-shop"
        ,
            "link": "assets/audio/data_resources_sounds_coffee-shop.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-coffee-shop.png"
        }
    ],
    [
        {
            "title": "Fireplace"
        ,
            "link": "assets/audio/data_resources_sounds_fireplace.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-fire.png"
        }
    ],[
        {
            "title": "Wind"
        ,
            "link": "assets/audio/data_resources_sounds_wind.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-wind.png"
        }
    ],[
        {
            "title": "Train"
        ,
            "link": "assets/audio/data_resources_sounds_train.ogg"
        ,
            "icon": "WeatherIcons.storm_train"
        ,
            "image": "assets/img/icons8-train.png"
        }
    ],[
        {
            "title": "Wave"
        ,
            "link": "assets/audio/data_resources_sounds_waves.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-waves.png"
        }
    ],[
        {
            "title": "beach"
        ,
            "link": "assets/audio/data_resources_sounds_beach.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-beach.png"
        }
    ],[
        {
            "title": "cats-mrrr"
        ,
            "link": "assets/audio/data_resources_sounds_cats-mrrr.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-cats-mrrr.png"
        }
    ],[
        {
            "title": "farm"
        ,
            "link": "assets/audio/data_resources_sounds_farm.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-farm.png"
        }
    ],[
        {
            "title": "grass"
        ,
            "link": "assets/audio/data_resources_sounds_grass.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-grass.png"
        }
    ],[
        {
            "title": "owl"
        ,
            "link": "assets/audio/data_resources_sounds_owl.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-owl.png"
        }
    ],[
        {
            "title": "purple-circle"
        ,
            "link": "assets/audio/data_resources_sounds_purple-circle.ogg"
        ,
            "icon": "WeatherIcons.storm_showers"
        ,
            "image": "assets/img/icons8-purple-circle.png"
        }
    ]
]

''';

class SoundRepository {
  final String data;

  SoundRepository(this.data);

  List<SoundItem> getSoundsData() {
    List rawData = json.decode(data);
    List<SoundItem> soundsData = [];
    for (var sound in rawData) {
      soundsData.add(
        SoundItem(
            title: sound[0]['title'],
            url: sound[0]['link'],
            img: sound[0]['image']),
      );
    }
    return soundsData;
  }

  List<Widget> getSoundButtons() {
    List<SoundItem> soundsList = getSoundsData();
    final wiggetsList = <Widget>[];
    for (SoundItem sound in soundsList) {
      wiggetsList.add(SoundButton(sound: sound));
    }
    return wiggetsList;
  }
}
