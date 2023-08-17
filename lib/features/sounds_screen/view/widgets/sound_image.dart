import 'package:atmosphere/models/sound_item.dart';
import 'package:flutter/material.dart';

class SoundImage extends StatelessWidget {
  const SoundImage({
    super.key,
    required this.sound,
  });

  final SoundItem sound;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Image.asset(
        sound.img,
        scale: 1.5,
        color: sound.isActive ? null : const Color.fromARGB(177, 15, 19, 51),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
