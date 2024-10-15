import 'package:cubit_app/src/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:cubit_app/src/router/app_routes.dart';
import 'package:cubit_app/src/router/not_found_screen.dart';
import 'package:cubit_app/src/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      final bool isSplash = context.read<SplashCubit>().state is SplashSuccess;
      if (isSplash) {
        print('Splash Success $isSplash');
      }
      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
