import 'package:flutter/material.dart';
import 'package:atmosphere/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AtmosphereApp());
}

class AtmosphereApp extends StatelessWidget {
  const AtmosphereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.montserratSubrayadaTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          colorSchemeSeed: Colors.blueGrey.shade400),
      home: const WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
      },
    );
  }
}
