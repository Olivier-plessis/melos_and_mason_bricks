import 'package:cubit_app/src/core/theme/brightness_theme/brightness_cubit.dart';
import 'package:cubit_app/src/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:cubit_app/src/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:cubit_app/src/router/router_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
            create: (context) => SplashCubit()..appStart()),
        BlocProvider<BrightnessCubit>(create: (context) => BrightnessCubit()),
        BlocProvider<RouterCubit>(create: (context) => RouterCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      ],
      child: child,
    );
  }
}
