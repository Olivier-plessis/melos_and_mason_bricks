import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/app.dart';
import 'package:simple_app/src/core/utils/observers.dart';
import 'package:simple_app/src/core/utils/register_error_handler.dart';
import 'package:simple_app/src/core/utils/shared_preference_provider.dart';

Future<void> main() async {
  // turn off the # in the URLs on the web and remove if only mobil app development
  usePathUrlStrategy();
  registerErrorHandler();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer(
      observers: <ProviderObserver>[
        Observers(),
      ],
    );
    await container.read(sharedPreferencesProvider.future);
    runApp(UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        enabled: !kReleaseMode && !kIsWeb,
        tools: [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => MainApp(), // Wrap your app
      ),
    ));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
