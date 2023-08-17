import 'package:atmosphere/models/playlist.dart';
import 'package:atmosphere/models/sound_item.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';

class MyAudioHandler extends BaseAudioHandler {
  MyAudioHandler() {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [MediaControl.play],
        processingState: AudioProcessingState.ready,
      ),
    );
  }

  @override
  Future<void> play() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: [MediaControl.pause],
        processingState: AudioProcessingState.ready,
      ),
    );
    for (SoundItem sound in GetIt.I<Playlist>().playedSounds) {
      sound.playSound();
    }
  }

  @override
  Future<void> pause() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        controls: [MediaControl.play],
        processingState: AudioProcessingState.ready,
      ),
    );
    for (SoundItem sound in GetIt.I<Playlist>().playedSounds) {
      sound.pauseSound();
    }
  }

  @override
  Future<void> stop() async {
    // Release any audio decoders back to the system

    // Set the audio_service state to `idle` to deactivate the notification.
    playbackState.add(playbackState.value.copyWith(
      processingState: AudioProcessingState.idle,
    ));
  }
}
