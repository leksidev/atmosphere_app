import 'package:atmosphere/widgets/themes_change_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAlias,
        excludeHeaderSemantics: true,
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: const [ThemesChangeIconButton()],
        title: const Text(
          "СВОЯ АТМОСФЕРА",
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: child,
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(microseconds: 700),
        destinations: const [
          NavigationDestination(icon: Icon(LineIcons.music), label: 'Sounds'),
          NavigationDestination(
              icon: Icon(LineIcons.audioFile), label: 'Pressets'),
          NavigationDestination(
              icon: Icon(LineIcons.infoCircle), label: 'Info'),
        ],
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    // if (location.startsWith('/')) {
    //   return 0;
    // }
    if (location.startsWith('/pressets')) {
      return 1;
    }
    if (location.startsWith('/info')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/pressets');
        break;
      case 2:
        GoRouter.of(context).go('/info');
        break;
    }
  }
}
