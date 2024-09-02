import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

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
