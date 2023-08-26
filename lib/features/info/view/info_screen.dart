import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const FlutterLogo(),
        Text(
            "АТМОСФЕРА — приложение для создания комбинаций из фоновых звуков для расслабления, медитайций, работы, учебы, сна.",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 10,
        ),
        Text(
            "1. Создайте шум, под который сможете расслабиться или сосредоточиться.",
            style: Theme.of(context).textTheme.bodyLarge),
        Text("2. Сохраните настройки.",
            style: Theme.of(context).textTheme.bodyLarge),
        Text("3. Управляйте воспроизведением из шторки уведомлений.",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Row(
          children: [
            const Text("Иконки:"),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://icons8.com');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text('Icons8'),
            ),
          ],
        ),
        Row(
          children: [
            const Text("Звуки:"),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://zvukipro.com/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text('zvukipro.com'),
            ),
          ],
        ),
      ],
    );
  }
}
