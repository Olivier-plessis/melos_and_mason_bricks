import 'package:bloc_app/src/core/theme/brightness_theme/brightness_event.dart';
import 'package:bloc_app/src/core/theme/brightness_theme/brightness_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, BrightnessState> {
  BrightnessBloc() : super(BrightnessState(ThemeMode.dark)) {
    on<ToggleBrightnessEvent>(_onToggleBrightness);
  }

  void _onToggleBrightness(
      ToggleBrightnessEvent event, Emitter<BrightnessState> emit) {
    final newThemeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(BrightnessState(newThemeMode));
  }

  IconData toggleIcon() {
    return state.themeMode == ThemeMode.light
        ? Icons.dark_mode
        : Icons.light_mode;
  }

  Color toggleColor() {
    return state.themeMode == ThemeMode.light ? Colors.red : Colors.purple;
  }
}
