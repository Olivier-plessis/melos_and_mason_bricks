import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/src/core/theme/dark_theme.dart';
import 'package:{{name.snakeCase()}}/src/core/theme/light_theme.dart';

extension AppThemeData on ThemeData {
  static ThemeData light() =>
      lightTheme._customAppTheme();
  static ThemeData dark() =>
      darkTheme._customAppTheme();

  ThemeData _customAppTheme() {
    // An updated theme with your own
    return copyWith(
      
    );
  }
}
