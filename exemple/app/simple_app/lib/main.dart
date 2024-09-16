import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/app.dart';
import 'package:simple_app/src/core/utils/observers.dart';

Future<void> main() async {
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  registerErrorHandlers();
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

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
