import 'package:flutter/material.dart';
import 'package:atmosphere/components/sound_widget.dart';
import 'package:atmosphere/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Atmosphere'),
        titleTextStyle: const TextStyle(
          fontFamily: 'JosefinSans',
          color: Colors.blueGrey,
          fontSize: 60.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogSounds['Storm']?.isSoundPlayNow =
                        !catalogSounds['Storm']!.isSoundPlayNow;
                    catalogSounds['Storm']?.playSound();
                  },
                );
              },
              icon: Icon(catalogSounds['Storm']?.icon,
                  size: 60.0,
                  color: catalogSounds['Storm']!.isSoundPlayNow
                      ? Colors.red
                      : Colors.grey),
              volumeValue: catalogSounds['Storm']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogSounds['Storm']!.currentSoundVolume = value;
                  catalogSounds['Storm']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogSounds['Birds']?.isSoundPlayNow =
                        !catalogSounds['Birds']!.isSoundPlayNow;
                    catalogSounds['Birds']?.playSound();
                  },
                );
              },
              icon: Icon(catalogSounds['Birds']?.icon,
                  size: 60.0,
                  color: catalogSounds['Birds']!.isSoundPlayNow
                      ? Colors.red
                      : Colors.grey),
              volumeValue: catalogSounds['Birds']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogSounds['Birds']!.currentSoundVolume = value;
                  catalogSounds['Birds']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogSounds['City']?.isSoundPlayNow =
                        !catalogSounds['City']!.isSoundPlayNow;
                    catalogSounds['City']?.playSound();
                  },
                );
              },
              icon: Icon(catalogSounds['City']?.icon,
                  size: 60.0,
                  color: catalogSounds['City']!.isSoundPlayNow
                      ? Colors.red
                      : Colors.grey),
              volumeValue: catalogSounds['City']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogSounds['City']!.currentSoundVolume = value;
                  catalogSounds['City']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogSounds['Coffee-shop']?.isSoundPlayNow =
                        !catalogSounds['Coffee-shop']!.isSoundPlayNow;
                    catalogSounds['Coffee-shop']?.playSound();
                  },
                );
              },
              icon: Icon(catalogSounds['Coffee-shop']?.icon,
                  size: 60.0,
                  color: catalogSounds['Coffee-shop']!.isSoundPlayNow
                      ? Colors.red
                      : Colors.grey),
              volumeValue: catalogSounds['Coffee-shop']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogSounds['Coffee-shop']!.currentSoundVolume = value;
                  catalogSounds['Coffee-shop']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogSounds['Fireplace']?.isSoundPlayNow =
                        !catalogSounds['Fireplace']!.isSoundPlayNow;
                    catalogSounds['Fireplace']?.playSound();
                  },
                );
              },
              icon: Icon(catalogSounds['Fireplace']?.icon,
                  size: 60.0,
                  color: catalogSounds['Fireplace']!.isSoundPlayNow
                      ? Colors.red
                      : Colors.grey),
              volumeValue: catalogSounds['Fireplace']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogSounds['Fireplace']!.currentSoundVolume = value;
                  catalogSounds['Fireplace']!.setVolume();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
