import 'package:cubit_app/src/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:cubit_app/src/router/router_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          context.read<RouterCubit>().goHome();
        }
      },
      child: Scaffold(
        body: Center(
          child: Text('Loading ...'),
        ),
      ),
    );
  }
}
