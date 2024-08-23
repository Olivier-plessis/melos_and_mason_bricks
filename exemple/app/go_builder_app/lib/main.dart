import 'dart:async';

import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_builder_app/src/app.dart';
import 'package:go_builder_app/src/core/utils/observers.dart';

Future<void> main() async {
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(ProviderScope(observers: <ProviderObserver>[
      Observers(),
    ], child: const MainApp()));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
