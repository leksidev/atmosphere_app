import 'package:atmosphere/models/sound_model.dart';
import 'package:atmosphere/widgets/sound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundsScreen extends StatelessWidget {
  SoundsScreen({super.key});

  final soundModel = SoundModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SoundsList(soundModel: soundModel),
    );
  }
}

class SoundsList extends StatelessWidget {
  const SoundsList({
    super.key,
    required this.soundModel,
  });

  final SoundModel soundModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: soundModel.soundsList.keys.map((soundName) {
        return Consumer<SoundModel>(
          builder: (context, soundModel, child) => SoundWidget(
            onPress: () {
              soundModel.togglePlaybackControl(soundName);
            },
            icon: Icon(
              soundModel.soundsList[soundName]?.icon,
              size: 20.0,
              color: soundModel.isSoundPlayNow(soundName)
                  ? Colors.blueAccent
                  : Colors.grey,
            ),
            image: AnimatedCrossFade(
              firstChild: Stack(
                children: [
                  soundModel.soundsList[soundName]!.image,
                  Image.asset('assets/img/icons8-pause.png',
                      height: 60.0,
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      colorBlendMode: BlendMode.modulate)
                ],
              ),
              secondChild: soundModel.soundsList[soundName]!.image,
              crossFadeState: soundModel.isSoundPlayNow(soundName)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(microseconds: 2000),
            ),
            volumeValue: soundModel.currentSoundVolume(soundName),
            volumeOnChanged: (double value) {
              soundModel.setVolume(soundName, value);
            },
          ),
        );
      }).toList(),
    );
  }
}
