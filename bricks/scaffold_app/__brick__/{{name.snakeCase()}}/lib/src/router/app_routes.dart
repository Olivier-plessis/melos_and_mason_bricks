import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/src/router/scaffold_with_nested_navigation.dart';
import 'package:{{name.snakeCase()}}/src/splash_screen.dart';

{{^codegen}}
import 'package:{{name.snakeCase()}}/src/router/route_constants.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/counter_screen.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/empty_screen.dart';
{{/codegen}}

{{#codegen}}
import 'package:{{name.snakeCase()}}/src/router/app_shell_routes.dart';

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
{{/codegen}}

{{^codegen}}
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
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
      ])
];

{{/codegen}}