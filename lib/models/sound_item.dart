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
    await player.setAsset(
      url,
    );
    player.play();
  }

  void pauseSound() async {
    await player.stop();
  }

  void setVolume(double volume) {
    _currentVolume = volume;
    player.setVolume(_currentVolume);
  }

  get volume => _currentVolume;

  set played(bool play) => _isActive = !play;

  get isActive => _isActive;
}
