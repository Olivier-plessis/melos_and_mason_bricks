import 'dart:async';

import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
{{#isRiverpod}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{name.snakeCase()}}/src/core/utils/observers.dart';

{{/isRiverpod}}

{{#isBlocOrCubit}}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{name.snakeCase()}}/src/core/utils/bloc_observer.dart';
import 'package:{{name.snakeCase()}}/src/core/services/bloc_widget.dart';
{{/isBlocOrCubit}}

import 'package:{{name.snakeCase()}}/src/app.dart';

import 'package:{{name.snakeCase()}}/src/core/utils/register_error_handler.dart';

Future<void> main() async {
  {{#isBlocOrCubit}}Bloc.observer = AppBlocObserver();{{/isBlocOrCubit}}
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  registerErrorHandler();
 
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp({{#isBlocOrCubit}}const BlocWidget({{/isBlocOrCubit}}
      {{#isRiverpod}}ProviderScope(observers: <ProviderObserver>[
          Observers(),
        ],{{/isRiverpod}}
     child:  MainApp()));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
