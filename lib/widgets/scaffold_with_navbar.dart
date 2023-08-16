import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(microseconds: 500),
        destinations: const [
          NavigationDestination(icon: Icon(LineIcons.music), label: 'Sounds'),
          NavigationDestination(
              icon: Icon(LineIcons.audioFile), label: 'Pressets'),
          NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
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
    }
  }
}
