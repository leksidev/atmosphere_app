import 'package:atmosphere/features/sounds_screen/view/widgets/sound_image.dart';
import 'package:atmosphere/models/sound_item.dart';
import 'package:flutter/material.dart';

class SoundButton extends StatelessWidget {
  final SoundItem sound;

  const SoundButton({super.key, required this.sound});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: SoundImage(sound: sound),
    );
  }
}
