import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FlutterLogo(),
        Text('''АТМОСФЕРА — приложение для комбинации фоновых звуков. 
            Создайте шум, под который сможете расслабиться или сосредоточиться; 
            сохраните настройки; управляйте воспроизведением из шторки уведомлений.''')
      ],
    );
  }
}
