import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/core/theme/theme_mode_controller.dart';
import 'package:simple_app/src/router/app_router.dart';
import 'package:simple_ui/simple_ui.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => DevicePreview.appBuilder(
        context,
        MaterialApp.router(
          locale: DevicePreview.locale(context),
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: AppThemeData.light(),
          darkTheme: AppThemeData.dark(),
          themeMode: themeMode,
          onGenerateTitle: (BuildContext context) => 'Simple app',
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(0.8),
              ),
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
