import 'dart:async';

import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/src/core/utils/bloc_observer.dart';
import 'package:bloc_app/src/core/services/bloc_widget.dart';

import 'package:bloc_app/src/app.dart';

import 'package:bloc_app/src/core/utils/register_error_handler.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  registerErrorHandler();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const BlocWidget(child: MainApp()));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
