import 'package:atmosphere/features/sounds_screen/view/widgets/sound_button.dart';
import 'package:atmosphere/models/playlist.dart';
import 'package:atmosphere/models/sound_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundsList extends StatelessWidget {
  const SoundsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int soundsItemCounter =
        Provider.of<Playlist>(context, listen: false).mutedSounds.length;

    final Playlist player = Provider.of<Playlist>(context, listen: false);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemCount: soundsItemCounter,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            SoundItem currentSound = player.mutedSounds[index];

            player.addToPlaylist(currentSound);

            if (currentSound.isActive) {
              player.mutedSounds[index].pauseSound();
            }
            if (!currentSound.isActive) {
              player.playedSounds[player.playedSounds.indexOf(currentSound)]
                  .playSound();
            }
          },
          child: SoundButton(
              sound: Provider.of<Playlist>(context).mutedSounds[index]),
        );
      },
    );
  }
}
