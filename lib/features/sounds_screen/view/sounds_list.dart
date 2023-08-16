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
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount:
          Provider.of<Playlist>(context, listen: false).mutedSounds.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            SoundItem currentSound =
                Provider.of<Playlist>(context, listen: false)
                    .mutedSounds[index];

            Provider.of<Playlist>(context, listen: false)
                .addToPlaylist(currentSound);

            if (currentSound.isActive) {
              Provider.of<Playlist>(context, listen: false)
                  .mutedSounds[index]
                  .pauseSound();
              Provider.of<Playlist>(context, listen: false).deleteFromPlaylist(
                  Provider.of<Playlist>(context, listen: false)
                      .playedSounds[index]);
            }
            if (!currentSound.isActive) {
              Provider.of<Playlist>(context, listen: false)
                  .playedSounds[Provider.of<Playlist>(context, listen: false)
                      .playedSounds
                      .indexOf(currentSound)]
                  .playSound();
            }

            // Provider.of<Playlist>(context, listen: false)
            //     .playedSounds[index]
            //     .pauseSound();
            // Provider.of<Playlist>(context, listen: false).deleteFromPlaylist(
            //     Provider.of<Playlist>(context, listen: false)
            //         .playedSounds[index]);
          },
          child: SoundButton(
              sound: Provider.of<Playlist>(context).mutedSounds[index]),
        );
      },
    );
  }
}
