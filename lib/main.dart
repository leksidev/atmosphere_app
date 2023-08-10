import 'package:atmosphere/config/routes/routes.dart';
import 'package:flutter/material.dart';
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
