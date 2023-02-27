import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SoundWidget extends StatelessWidget {
  const SoundWidget(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.volumeValue,
      required this.volumeOnChanged})
      : super(key: key);

  final VoidCallback onPress;
  final Icon icon;
  final double volumeValue;
  final Function(double) volumeOnChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
