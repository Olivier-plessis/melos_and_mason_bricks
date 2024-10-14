import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrightnessCubit extends Cubit<ThemeMode> {
  BrightnessCubit() : super(ThemeMode.dark);

  void toggleBrightness() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  IconData toggleIcon() {
    final IconData currentIcon =
        state == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
    return currentIcon;
  }

  Color toggleColor() {
    final Color currentColor =
        state == ThemeMode.light ? Colors.red : Colors.purple;
    return currentColor;
  }
}
