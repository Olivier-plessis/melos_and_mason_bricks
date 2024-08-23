import 'package:flutter/material.dart';
import 'package:go_builder_app/src/feature/counter/presentation/counter_screen.dart';
import 'package:go_builder_app/src/feature/counter/presentation/empty_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:go_builder_app/src/feature/profile/presentation/pages/profile_screen.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
  static final GlobalKey<NavigatorState> $navigatorKey = _homeNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    /// TODO: change to your home route
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

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}
