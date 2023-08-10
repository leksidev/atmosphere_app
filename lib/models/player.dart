import 'package:audioplayers/audioplayers.dart';

class Player {
  final String soundURL;
  final double volume;
  double _currentVolume = 0.5;
  bool _isPlaying = false;

  Player({required this.volume, required this.soundURL});

  final player = AudioPlayer();

  void playbackControl() async {
    _isPlaying = !_isPlaying;
    if (_isPlaying) {
      await player.setSource(
        AssetSource(soundURL),
      );
      await player.setReleaseMode(ReleaseMode.loop);
      await player.resume();
    } else {
      await player.stop();
    }
  }

  void setVolume() {
    _currentVolume = volume;
    player.setVolume(_currentVolume);
  }
}
