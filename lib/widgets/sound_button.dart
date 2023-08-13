import 'package:atmosphere/models/sound_item.dart';
import 'package:flutter/material.dart';

class SoundButton extends StatelessWidget {
  final SoundItem sound;

  const SoundButton({super.key, required this.sound});

  @override
  Widget build(BuildContext context) {
    final double defaultRadius = MediaQuery.of(context).size.width / 4;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CircleAvatar(
        backgroundColor: sound.isActive ? Colors.blue : null,
        maxRadius: defaultRadius,
        child: Image.asset(
          sound.img,
          color:
              sound.isActive ? null : const Color.fromRGBO(255, 255, 255, 0.7),
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }
}
