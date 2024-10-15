import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_builder_app/src/feature/settings/presentation/pages/settings_screen.dart';
import 'package:go_builder_app/src/router/scaffold_with_nested_navigation.dart';
import 'package:go_builder_app/src/splash_screen.dart';

import 'package:go_builder_app/src/router/app_shell_routes.dart';

part 'app_routes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<SplashRoute>(path: "/splash")
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<SettingsRoute>(path: "/settings")
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

@TypedStatefulShellRoute<MainShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      TypedStatefulShellBranch<HomeShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<HomeRouteData>(
            name: 'home',
            path: '/',
          ),
        ],
      ),

      /// TODO: remove after adding the new feature
      TypedStatefulShellBranch<DeleteShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<DeleteRouteData>(
            name: 'delete',
            path: '/delete',
          ),
        ],
      ),
      TypedStatefulShellBranch<ProfileShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<ProfileRouteData>(
            name: 'profile',
            path: '/profile',
          ),
        ],
      ),
    ])
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _rootNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNestedNavigation(
      navigationShell: navigationShell,
    );
  }
}
