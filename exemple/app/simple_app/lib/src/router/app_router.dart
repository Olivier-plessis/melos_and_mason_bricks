import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_app/src/router/app_routes.dart';

import 'package:simple_app/src/router/not_found_screen.dart';

import 'package:simple_app/src/router/route_constants.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routKey = GlobalKey<NavigatorState>(debugLabel: 'routeKey');

  final router = GoRouter(
    navigatorKey: routKey,
    initialLocation: AppPage.splash.routePath,
    debugLogDiagnostics: true,
    routes: appRoutes,
    redirect: (context, state) {
      final bool isSplash = state.uri.path == AppPage.splash.routePath;
      if (isSplash) {
        final String location = AppPage.home.routePath;
        return location;
      }
      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  ref.onDispose(router.dispose);

  return router;
}
