import 'package:atmosphere/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemesChangeIconButton extends StatelessWidget {
  const ThemesChangeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(context.read<ThemeModel>().isDark
            ? Icons.nightlight_round
            : Icons.wb_sunny),
        onPressed: () {
          context.read<ThemeModel>().isDark
              ? context.read<ThemeModel>().isDark = false
              : context.read<ThemeModel>().isDark = true;
        });
  }
}
