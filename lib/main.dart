import 'package:flutter/material.dart';
import 'package:atmosphere/screens/wellcome_screen.dart';

void main() {
  runApp(const AtmosphereApp());
}

class AtmosphereApp extends StatelessWidget {
  const AtmosphereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: Colors.lightBlue.shade100),
      home: const WellcomeScreen(),
    );
  }
}
