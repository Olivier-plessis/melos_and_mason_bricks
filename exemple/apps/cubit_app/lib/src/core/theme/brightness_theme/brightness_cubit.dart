import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cubit_ui/cubit_ui.dart';

class BrightnessCubit extends HydratedCubit<ThemeMode> {
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
        state == ThemeMode.light ? Palette.secondBackground : Palette.primary;
    return currentColor;
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    return <String, int>{'theme': state.index};
  }
}
