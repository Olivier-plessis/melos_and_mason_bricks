import 'dart:async';

import 'package:cubit_app/src/app.dart';
import 'package:cubit_app/src/core/services/bloc_widget.dart';
import 'package:cubit_app/src/core/utils/bloc_observer.dart';
import 'package:cubit_app/src/core/utils/register_error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  registerErrorHandler();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );

    runApp(const BlocWidget(child: MainApp()));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
