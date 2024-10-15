import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bloc_app/src/router/app_routes.dart';

import 'package:bloc_app/src/router/not_found_screen.dart';

import 'package:bloc_app/src/router/route_constants.dart';

import 'router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

mixin AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppPage.splash.routePath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [
      RouterObserver(),
    ],
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
}
