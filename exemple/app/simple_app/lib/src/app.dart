import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/core/theme/dark_theme.dart';
import 'package:simple_app/src/core/theme/light_theme.dart';
import 'package:simple_app/src/core/theme/theme_mode_controller.dart';
import 'package:simple_app/src/router/app_router.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    final theme = themeMode == ThemeMode.light ? lightTheme : darkTheme;

    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        theme: theme,
        darkTheme: theme,
        themeMode: themeMode,
        onGenerateTitle: (BuildContext context) => 'mason starter',
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
