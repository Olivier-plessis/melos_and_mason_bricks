import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

{{#codegen}}
import 'package:{{name.snakeCase()}}/src/router/app_routes.dart';
{{/codegen}}

import 'package:{{name.snakeCase()}}/src/router/app_shell_routes.dart';
import 'package:{{name.snakeCase()}}/src/router/not_found_screen.dart';
{{^codegen}}
import 'package:{{name.snakeCase()}}/src/router/route_constants.dart';
{{/codegen}}


part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routKey = GlobalKey<NavigatorState>(debugLabel: 'routeKey');

  final router = GoRouter(
    navigatorKey: routKey,
    initialLocation:  {{#codegen}}const SplashRoute().location{{/codegen}}{{^codegen}}AppPage.splash.routePath{{/codegen}},
    debugLogDiagnostics: true,
    routes: {{#codegen}}$appRoutes{{/codegen}}{{^codegen}}appRoutes{{/codegen}},
    redirect: (context, state) {
      final bool isSplash = state.uri.path == {{#codegen}}const SplashRoute().location{{/codegen}}{{^codegen}}AppPage.splash.routePath{{/codegen}};
      if (isSplash) {
       final String location =  {{#codegen}}const HomeRouteData().location{{/codegen}}{{^codegen}}AppPage.home.routePath{{/codegen}};
        return  location ;
      }
      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

   ref.onDispose(router.dispose);

  return router;
}
