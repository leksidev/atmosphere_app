import 'package:atmosphere/features/info/view/info_screen.dart';
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
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SoundsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(-1.0, 0.0),
                    ).animate(secondaryAnimation),
                    child: child,
                  ),
                );
              },
              // FadeTransition(opacity: animation, child: child),
            ),
            // builder: (context, state) {
            //   return const SoundsScreen();
            // },
          ),
          GoRoute(
            path: '/pressets',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const PressetsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(-1.0, 0.0),
                    ).animate(secondaryAnimation),
                    child: child,
                  ),
                );
              },
              // FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: '/info',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const InfoScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(-1.0, 0.0),
                    ).animate(secondaryAnimation),
                    child: child,
                  ),
                );
              },
              // FadeTransition(opacity: animation, child: child),
            ),
          ),
          // GoRoute(
          //   path: '/pressets',
          //   pageBuilder: (context, state) => CustomTransitionPage<void>(
          //     key: state.pageKey,
          //     child: const PressetsScreen(),
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) =>
          //             FadeTransition(opacity: animation, child: child),
          //   ),
          //   // builder: (context, state) => const PressetsScreen(),
          // ),
        ]),
  ],
);
