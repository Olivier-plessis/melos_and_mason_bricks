import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc_app/src/feature/profile/presentation/pages/profile_screen.dart';
import 'package:bloc_app/src/router/scaffold_with_nested_navigation.dart';
import 'package:bloc_app/src/splash_screen.dart';

import 'package:bloc_app/src/router/route_constants.dart';
import 'package:bloc_app/src/feature/counter/presentation/counter_screen.dart';
import 'package:bloc_app/src/feature/counter/presentation/empty_screen.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
final _featureNameNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'featureName');
final _emptyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'empties');

List<RouteBase> appRoutes = [
  GoRoute(
    path: AppPage.splash.routePath,
    name: AppPage.splash.routeName,
    builder: (context, state) => const SplashScreen(),
  ),
  StatefulShellRoute.indexedStack(
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          NoTransitionPage(
            child: ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
            ),
          ),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: AppPage.home.routePath,
              name: AppPage.home.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CounterScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _emptyNavigatorKey,
          routes: [
            GoRoute(
              path: AppPage.empty.routePath,
              name: AppPage.empty.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EmptyScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: AppPage.profile.routePath,
              name: AppPage.profile.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        ),
      ])
];
