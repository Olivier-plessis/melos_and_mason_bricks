import 'package:flutter/material.dart';

import '../core/utils/logger.dart';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _logNavigation(route.settings.name, '⏩️ pushed');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logNavigation(route.settings.name, '️👉 popped');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      _logNavigation(newRoute.settings.name, '⬅️ replaced');
    }
  }

  void _logNavigation(String? routeName, String? action) {
    if (routeName != null) {
      L.log(' 🌍 Navigation $action: $routeName');
    }
  }
}
