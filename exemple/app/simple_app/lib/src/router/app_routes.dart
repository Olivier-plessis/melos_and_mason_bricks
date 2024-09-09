import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/src/feature/counter/presentation/counter_screen.dart';
import 'package:simple_app/src/feature/counter/presentation/empty_screen.dart';
import 'package:simple_app/src/feature/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:simple_app/src/feature/profile/presentation/pages/profile_screen.dart';
import 'package:simple_app/src/feature/settings/presentation/pages/settings_screen.dart';
import 'package:simple_app/src/router/app_startup.dart';
import 'package:simple_app/src/router/route_constants.dart';
import 'package:simple_app/src/router/scaffold_with_nested_navigation.dart';
import 'package:simple_app/src/splash_screen.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
final _emptyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'empties');

List<RouteBase> appRoutes = [
  GoRoute(
    path: AppPage.splash.routePath,
    name: AppPage.splash.routeName,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppPage.startup.routePath,
    name: AppPage.startup.routeName,
    pageBuilder: (context, state) => NoTransitionPage(
      child: AppStartupWidget(
        // * This is just a placeholder
        // * The loaded route will be managed by GoRouter on state change
        onLoaded: (_) => const SizedBox.shrink(),
      ),
    ),
  ),
  GoRoute(
    path: AppPage.settings.routePath,
    name: AppPage.settings.routeName,
    builder: (context, state) => const SettingsScreen(),
  ),
  GoRoute(
    path: AppPage.onboarding.routePath,
    name: AppPage.onboarding.routeName,
    builder: (context, state) => const OnboardingScreen(),
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
