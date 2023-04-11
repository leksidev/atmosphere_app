import 'package:flutter/material.dart';
import 'package:atmosphere/screens/sounds_screen.dart';
import 'package:provider/provider.dart';

import 'models/sound_model.dart';

void main() {
  runApp(const AtmosphereApp());
}

class AtmosphereApp extends StatelessWidget {
  const AtmosphereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SoundModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        home: const SoundsScreen(),
        initialRoute: SoundsScreen.id,
        routes: {
          SoundsScreen.id: (context) => const SoundsScreen(),
        },
      ),
    );
  }
}
