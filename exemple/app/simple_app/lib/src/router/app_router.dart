import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_app/src/feature/onboarding/data/repository/onboarding_repository.dart';
import 'package:simple_app/src/router/app_routes.dart';
import 'package:simple_app/src/router/app_startup.dart';
import 'package:simple_app/src/router/not_found_screen.dart';
import 'package:simple_app/src/router/route_constants.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routKey = GlobalKey<NavigatorState>(debugLabel: 'routeKey');
  final appStartupState = ref.watch(appStartupProvider);

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

      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return AppPage.startup.routePath;
      }
      final onboardingRepository =
          ref.read(onboardingRepositoryProvider).requireValue;
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();

      final path = state.uri.path;
      if (!didCompleteOnboarding) {
        // Always check state.subloc before returning a non-null route
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        if (path != AppPage.onboarding.routePath) {
          return AppPage.onboarding.routePath;
        }
        return null;
      }
      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  ref.onDispose(router.dispose);

  return router;
}
