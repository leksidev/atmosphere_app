import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:atmosphere/components/sound_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final player = AudioPlayer();
  double currentElementVolume = 0.5;
  bool playIndicator = false;

  void playSound(String sound, bool playSound) async {
    await player.setSource(
      AssetSource(sound),
    );
    if (playSound) {
      await player.resume();
    } else {
      await player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atmosphere'),
        scrolledUnderElevation: 3.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    playIndicator = !playIndicator;
                    playSound(
                        'audio/data_resources_sounds_storm.ogg', playIndicator);
                  },
                );
              },
              icon: Icon(WeatherIcons.storm_showers,
                  size: 80.0, color: playIndicator ? Colors.red : Colors.grey),
              volumeValue: currentElementVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  currentElementVolume = value;
                  player.setVolume(currentElementVolume);
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    playIndicator = !playIndicator;
                    playSound(
                        'audio/data_resources_sounds_birds.ogg', playIndicator);
                  },
                );
              },
              icon: Icon(WeatherIcons.day_sunny,
                  size: 80.0, color: playIndicator ? Colors.red : Colors.grey),
              volumeValue: currentElementVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  currentElementVolume = value;
                  player.setVolume(currentElementVolume);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
