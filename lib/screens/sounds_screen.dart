import 'package:atmosphere/sound_data_catalogue.dart';
import 'package:flutter/material.dart';
import 'package:atmosphere/widgets/sound_widget.dart';
import 'package:provider/provider.dart';
import 'package:atmosphere/models/sound_model.dart';

class SoundsScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final soundModel = SoundModel();

    return ChangeNotifierProvider.value(
      value: soundModel,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade400,
          centerTitle: true,
          title: const Text('Атмосфера'),
          titleTextStyle:
              const TextStyle(fontSize: 40.0, color: Colors.black54),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(12.0),
          child: ListView(
            children: catalogueSounds.keys.map((soundName) {
              return Consumer<SoundModel>(
                builder: (context, soundModel, child) => SoundWidget(
                  onPress: () {
                    soundModel.togglePlaybackControl(soundName);
                  },
                  icon: Icon(
                    catalogueSounds[soundName]?.icon,
                    size: 60.0,
                    color: soundModel.isSoundPlayNow(soundName)
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                  image: catalogueSounds[soundName]!.image,
                  volumeValue: soundModel.currentSoundVolume(soundName),
                  volumeOnChanged: (double value) {
                    soundModel.setVolume(soundName, value);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
