import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_builder_app/src/router/app_routes.dart';

import 'package:go_builder_app/src/router/app_shell_routes.dart';

import 'package:go_builder_app/src/router/not_found_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routKey = GlobalKey<NavigatorState>(debugLabel: 'routeKey');

  final router = GoRouter(
    navigatorKey: routKey,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final bool isSplash = state.uri.path == const SplashRoute().location;
      if (isSplash) {
        final String location = const HomeRouteData().location;
        return location;
      }
      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  ref.onDispose(router.dispose);

  return router;
}
