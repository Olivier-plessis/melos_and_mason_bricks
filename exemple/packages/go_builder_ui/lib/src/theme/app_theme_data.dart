import 'package:flutter/material.dart';
import 'package:go_builder_ui/go_builder_ui.dart';

extension AppThemeData on ThemeData {
  static ThemeData light() => lightTheme._customAppTheme();
  static ThemeData dark() => darkTheme._customAppTheme();

  ThemeData _customAppTheme() {
    // An updated theme with your own
    return copyWith(
      // Just an example of how you can add your own theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(Sizes.p16),
          textStyle: StyleTheme.bodySmall,
        ),
      ),
    );
  }
}
