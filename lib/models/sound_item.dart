import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class SoundItem {
  final String title;
  final String url;
  final String img;
  double _currentVolume = 0.5;
  bool _isActive = true;

  SoundItem({required this.title, required this.url, required this.img});

  final player = AudioPlayer();

  void playSound() async {
    await player.setAudioSource(
      AudioSource.asset(
        url,
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: url,
          // Metadata to display in the notification:
          title: title,
        ),
      ),
    );
    // await player.setAsset(
    //   url,
    // );
    // player.loopMode;
    // player.setLoopMode(LoopMode.one);
    player.play();
  }

  void pauseSound() async {
    await player.pause();
  }

  void setVolume(double volume) {
    _currentVolume = volume;
    player.setVolume(_currentVolume);
  }

  get volume => _currentVolume;

  set played(bool play) => _isActive = !play;

  get isActive => _isActive;
}
