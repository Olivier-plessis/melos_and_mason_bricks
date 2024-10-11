import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:{{name.snakeCase()}}/src/core/theme/app_theme_data.dart';

{{#isRiverpod}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{name.snakeCase()}}/src/core/theme/theme_mode_controller.dart';
import 'package:{{name.snakeCase()}}/src/router/app_router.dart';
{{/isRiverpod}}



{{#isBloc}}
import 'package:{{name.snakeCase()}}/src/core/theme/brightness_theme/brightness_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{name.snakeCase()}}/src/router/router_cubit.dart';
{{/isBloc}}

class MainApp extends  {{#isRiverpod}} ConsumerWidget {{/isRiverpod}}{{#isBloc}} StatelessWidget {{/isBloc}} {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context  {{#isRiverpod}}, WidgetRef ref {{/isRiverpod}}) {
    {{#isRiverpod}} final ThemeMode themeMode = ref.watch(themeModeControllerProvider); {{/isRiverpod}}
    {{#isBloc}} final themeMode = context.watch<BrightnessBloc>().state.themeMode; {{/isBloc}}

    final goRouter = {{#isRiverpod}}ref.watch(goRouterProvider){{/isRiverpod}}{{#isBloc}}context.read<RouterCubit>().state{{/isBloc}};
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
        onGenerateTitle: (BuildContext context) => '{{name.sentenceCase()}}',
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
