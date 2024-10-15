import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_app/src/core/theme/brightness_theme/brightness_bloc.dart';
import 'package:bloc_app/src/router/router_bloc.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BrightnessBloc>(create: (context) => BrightnessBloc()),
        BlocProvider<RouterBloc>(create: (context) => RouterBloc()),
      ],
      child: child,
    );
  }
}
