import 'package:flutter/material.dart';

class SoundWidget extends StatelessWidget {
  const SoundWidget(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.volumeValue,
      required this.volumeOnChanged})
      : super(key: key);

  final VoidCallback onPress;
  final Widget icon;
  final double volumeValue;
  final Function(double) volumeOnChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: onPress,
              child: icon,
            ),
            Slider(
              value: volumeValue,
              max: 1.0,
              onChanged: volumeOnChanged,
            ),
          ],
        ),
      ),
    );
  }
}
