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
          titleTextStyle: const TextStyle(
              fontFamily: 'MarckScript', fontSize: 50.0, color: Colors.white),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: soundModel.soundsList.keys.map((soundName) {
              return Consumer<SoundModel>(
                builder: (context, soundModel, child) => SoundWidget(
                  onPress: () {
                    soundModel.togglePlaybackControl(soundName);
                  },
                  icon: Icon(
                    soundModel.soundsList[soundName]?.icon,
                    size: 60.0,
                    color: soundModel.isSoundPlayNow(soundName)
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                  image: soundModel.isSoundPlayNow(soundName)
                      ? Stack(
                          children: [
                            soundModel.soundsList[soundName]!.image,
                            Image.asset('assets/img/icons8-pause.png',
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                                colorBlendMode: BlendMode.modulate)
                          ],
                        )
                      : Stack(
                          fit: StackFit.loose,
                          children: [
                            soundModel.soundsList[soundName]!.image,
                            Image.asset('assets/img/icons8-play1.png',
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                                colorBlendMode: BlendMode.modulate)
                          ],
                        ),
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
