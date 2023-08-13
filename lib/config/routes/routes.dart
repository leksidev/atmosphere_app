import 'package:atmosphere/features/sounds_screen/view/sounds_screen.dart';
import 'package:atmosphere/features/pressets/view/pressets_screen.dart';
import 'package:atmosphere/widgets/scaffold_with_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
// GoRouter configuration
final router = GoRouter(
  observers: [
    TalkerRouteObserver(
      GetIt.I<Talker>(),
    )
  ],
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const SoundsScreen(),
          ),
          GoRoute(
            path: '/pressets',
            builder: (context, state) => const PressetsScreen(),
          ),
        ]),
  ],
);
