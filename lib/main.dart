import 'package:atmosphere/config/routes/routes.dart';
import 'package:atmosphere/firebase_options.dart';
import 'package:audio_service/audio_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'models/handlers/audio_handler.dart';
import 'models/playlist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  final player = Playlist();

  GetIt.I.registerSingleton(player);

  final audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.atmosphere.channel.audio',
      androidNotificationChannelName: 'Atmosphere',
      androidShowNotificationBadge: true,
      notificationColor: Colors.blueGrey,
    ),
  );

  GetIt.I.registerSingleton(audioHandler);

  runApp(const AtmosphereApp());
}

class AtmosphereApp extends StatelessWidget {
  const AtmosphereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Playlist>(
          create: (_) => GetIt.I<Playlist>(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
