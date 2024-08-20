import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/counter_screen.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/empty_screen.dart';

import 'package:go_router/go_router.dart';
{{^codegen}}

import 'package:{{name.snakeCase()}}/src/router/scaffold_with_nested_navigation.dart';
import 'package:{{name.snakeCase()}}/src/splash_screen.dart';
import 'package:{{name.snakeCase()}}/src/router/route_constants.dart';
{{/codegen}}
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
{{^codegen}}
final _emptyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'empties');
{{/codegen}}

{{^codegen}}
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
      ])
];

{{/codegen}}

{{#codegen}}
class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
  static final GlobalKey<NavigatorState> $navigatorKey = _homeNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterScreen();
  }
}

/// TODO: remove after adding the new feature
class DeleteShellBranchData extends StatefulShellBranchData {
  const DeleteShellBranchData();
}

class DeleteRouteData extends GoRouteData {
  const DeleteRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmptyScreen();
  }
}

{{/codegen}}