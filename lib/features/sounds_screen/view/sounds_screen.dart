import 'package:atmosphere/features/sounds_screen/view/sounds_list.dart';
import 'package:atmosphere/models/playlist.dart';
import 'package:atmosphere/features/sounds_screen/view/player_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 2, child: SoundsList()),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Provider.of<Playlist>(context).playedSounds.isEmpty
                  ? const Text('')
                  : Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.play_arrow),
                                  onPressed: () {
                                    context.read<Playlist>().resumePlaylist();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.pause),
                                  onPressed: () {
                                    context.read<Playlist>().pausePlaylist();
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.save_alt),
                                      Text('save as...'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const PlayerPanel(),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
