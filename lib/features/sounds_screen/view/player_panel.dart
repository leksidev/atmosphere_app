import 'package:atmosphere/models/playlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerPanel extends StatelessWidget {
  const PlayerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.builder(
        itemCount: Provider.of<Playlist>(context).playedSounds.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<Playlist>(context, listen: false)
                    .playedSounds[index]
                    .pauseSound();
                Provider.of<Playlist>(context, listen: false)
                    .deleteFromPlaylist(
                        Provider.of<Playlist>(context, listen: false)
                            .playedSounds[index]);
              },
            ),
            title: Slider(
              value: Provider.of<Playlist>(context).playedSounds[index].volume,
              onChanged: (value) =>
                  Provider.of<Playlist>(context, listen: false).changeVolume(
                      Provider.of<Playlist>(context, listen: false)
                          .playedSounds[index],
                      value),
            ),
            trailing: Image.asset(
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width / 15,
                Provider.of<Playlist>(context, listen: false)
                    .playedSounds[index]
                    .img),
          );
        },
      ),
    );
  }
}
