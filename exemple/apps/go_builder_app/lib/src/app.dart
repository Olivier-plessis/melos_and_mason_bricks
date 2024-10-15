import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_builder_app/src/core/theme/theme_mode_controller.dart';
import 'package:go_builder_app/src/router/app_router.dart';
import 'package:go_builder_ui/go_builder_ui.dart';

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
      builder: (context, child) => MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        theme: AppThemeData.light(),
        darkTheme: AppThemeData.dark(),
        themeMode: themeMode,
        onGenerateTitle: (BuildContext context) => 'Go builder app',
        builder: (
          BuildContext context,
          Widget? child,
        ) =>
            MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1),
          ),
          child: child ?? SizedBox.shrink(),
        ),
      ),
    );
  }
}
