import 'package:flutter/material.dart';
import 'package:atmosphere/widgets/sound_widget.dart';
import 'package:atmosphere/soundDataCatalogue.dart';
import 'package:provider/provider.dart';
import 'package:atmosphere/models/sound_model.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final soundModel = SoundModel();

    return ChangeNotifierProvider.value(
      value: soundModel,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade400,
          centerTitle: true,
          title: const Text('Atmosphere'),
          titleTextStyle:
              const TextStyle(fontSize: 40.0, color: Colors.black54),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(12.0),
          child: ListView(
            children: catalogueSounds.keys.map((soundName) {
              return Consumer<SoundModel>(
                builder: (context, model, child) => SoundWidget(
                  onPress: () {
                    model.togglePlaybackControl(soundName);
                  },
                  icon: Icon(
                    catalogueSounds[soundName]?.icon,
                    size: 60.0,
                    color: model.isSoundPlayNow(soundName)
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                  volumeValue: model.currentSoundVolume(soundName),
                  volumeOnChanged: (double value) {
                    model.setVolume(soundName, value);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:atmosphere/components/sound_widget.dart';
// import 'package:atmosphere/soundDataCatalogue.dart';
// import 'package:atmosphere/components/sound.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   static const String id = 'welcome_screen';
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   static const kIconSize = 60.0;
//   static const kIconSelectedColor = Colors.blueAccent;
//   static const kIconPrimaryColor = Colors.grey;
//
//   List<SoundWidget> getSoundWidgets() {
//     final List<SoundWidget> listSoundWidgets = [];
//     for (String soundName in catalogueSounds.keys) {
//       Sound? sound = catalogueSounds[soundName];
//       var newSoundWidget = SoundWidget(
//         onPress: () {
//           setState(
//             () {
//               catalogueSounds[soundName]?.playbackControl();
//             },
//           );
//         },
//         icon: Icon(sound?.icon,
//             size: kIconSize,
//             color: catalogueSounds[soundName]!.isSoundPlayNow
//                 ? kIconSelectedColor
//                 : kIconPrimaryColor),
//         volumeValue: catalogueSounds[soundName]!.currentSoundVolume,
//         volumeOnChanged: (double value) {
//           setState(() {
//             catalogueSounds[soundName]!.currentSoundVolume = value;
//             catalogueSounds[soundName]!.setVolume();
//           });
//         },
//       );
//       listSoundWidgets.add(newSoundWidget);
//     }
//     return listSoundWidgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey.shade400,
//         centerTitle: true,
//         title: const Text('Atmosphere'),
//         titleTextStyle: const TextStyle(fontSize: 40.0, color: Colors.black54),
//       ),
//       body: SafeArea(
//         minimum: const EdgeInsets.all(12.0),
//         child: ListView(
//           children: getSoundWidgets(),
//         ),
//       ),
//     );
//   }
// }
