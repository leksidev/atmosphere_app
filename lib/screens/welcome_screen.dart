import 'package:flutter/material.dart';
import 'package:atmosphere/components/sound_widget.dart';
import 'package:atmosphere/soundDataCatalogue.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const kIconSize = 60.0;
  static const kIconSelectedColor = Colors.blueAccent;
  static const kIconPrimaryColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
        title: const Text('Atmosphere'),
        titleTextStyle: const TextStyle(fontSize: 40.0, color: Colors.black54),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogueSounds['Storm']?.playbackControl();
                  },
                );
              },
              icon: Icon(catalogueSounds['Storm']?.icon,
                  size: kIconSize,
                  color: catalogueSounds['Storm']!.isSoundPlayNow
                      ? kIconSelectedColor
                      : kIconPrimaryColor),
              volumeValue: catalogueSounds['Storm']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogueSounds['Storm']!.currentSoundVolume = value;
                  catalogueSounds['Storm']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogueSounds['Birds']?.playbackControl();
                  },
                );
              },
              icon: Icon(catalogueSounds['Birds']?.icon,
                  size: kIconSize,
                  color: catalogueSounds['Birds']!.isSoundPlayNow
                      ? kIconSelectedColor
                      : kIconPrimaryColor),
              volumeValue: catalogueSounds['Birds']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogueSounds['Birds']!.currentSoundVolume = value;
                  catalogueSounds['Birds']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogueSounds['City']?.playbackControl();
                  },
                );
              },
              icon: Icon(catalogueSounds['City']?.icon,
                  size: kIconSize,
                  color: catalogueSounds['City']!.isSoundPlayNow
                      ? kIconSelectedColor
                      : kIconPrimaryColor),
              volumeValue: catalogueSounds['City']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogueSounds['City']!.currentSoundVolume = value;
                  catalogueSounds['City']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogueSounds['Coffee-shop']?.playbackControl();
                  },
                );
              },
              icon: Icon(catalogueSounds['Coffee-shop']?.icon,
                  size: kIconSize,
                  color: catalogueSounds['Coffee-shop']!.isSoundPlayNow
                      ? kIconSelectedColor
                      : kIconPrimaryColor),
              volumeValue: catalogueSounds['Coffee-shop']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogueSounds['Coffee-shop']!.currentSoundVolume = value;
                  catalogueSounds['Coffee-shop']!.setVolume();
                });
              },
            ),
            SoundWidget(
              onPress: () {
                setState(
                  () {
                    catalogueSounds['Fireplace']?.playbackControl();
                  },
                );
              },
              icon: Icon(catalogueSounds['Fireplace']?.icon,
                  size: kIconSize,
                  color: catalogueSounds['Fireplace']!.isSoundPlayNow
                      ? kIconSelectedColor
                      : kIconPrimaryColor),
              volumeValue: catalogueSounds['Fireplace']!.currentSoundVolume,
              volumeOnChanged: (double value) {
                setState(() {
                  catalogueSounds['Fireplace']!.currentSoundVolume = value;
                  catalogueSounds['Fireplace']!.setVolume();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
