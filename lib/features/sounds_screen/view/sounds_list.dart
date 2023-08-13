import 'package:atmosphere/models/playlist.dart';
import 'package:atmosphere/models/sound_item.dart';
import 'package:atmosphere/widgets/sound_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundsList extends StatelessWidget {
  const SoundsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 160,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: Provider.of<Playlist>(context).mutedSounds.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            SoundItem currentSound =
                Provider.of<Playlist>(context, listen: false)
                    .mutedSounds[index];

            Provider.of<Playlist>(context, listen: false)
                .addToPlaylist(currentSound);

            if (currentSound.isActive == false) {
              Provider.of<Playlist>(context, listen: false)
                  .playedSounds[Provider.of<Playlist>(context, listen: false)
                      .playedSounds
                      .indexOf(currentSound)]
                  .playSound();
            }

            if (currentSound.isActive) {
              Provider.of<Playlist>(context, listen: false)
                  .mutedSounds[Provider.of<Playlist>(context, listen: false)
                      .mutedSounds
                      .indexOf(currentSound)]
                  .pauseSound();
            }
          },
          child: SoundButton(
              sound: Provider.of<Playlist>(context).mutedSounds[index]),
        );
      },
    );
  }
}
