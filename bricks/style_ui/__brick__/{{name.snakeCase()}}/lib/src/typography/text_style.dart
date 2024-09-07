import 'package:{{name}}/src/constants/app_color.dart';
import 'package:{{name}}/src/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleTheme {
  StyleTheme._();

  static const TextStyle _baseMainTextStyle = TextStyle(
    package: '{{name}}',
    fontFamily: FontFamilyTheme.mainFont,
    color: Palette.primaryColor,
    fontWeight: FontWeightTheme.regular,
  );

  static const TextStyle _baseSecondaryTextStyle = TextStyle(
    package: '{{name}}',
    fontFamily: FontFamilyTheme.secondaryFont,
    color: Palette.secondaryColor,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get displayLarge {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.displayLarge.sp,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get displayMedium {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.displayMedium.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get displaySmall {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.displaySmall.sp,
      fontWeight: FontWeightTheme.semiBold,
    );
  }

  static TextStyle get headlineLarge {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.headlineLarge.sp,
      fontWeight: FontWeightTheme.semiBold,
    );
  }

  static TextStyle get headlineMedium {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.headlineMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headlineSmall {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.headlineSmall.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get titleLarge {
    return _baseSecondaryTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get titleMedium {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.titleMedium.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get titleSmall {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.titleSmall.sp,
      fontWeight: FontWeightTheme.light,
    );
  }

  static TextStyle get bodyLarge {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get bodyMedium {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get bodySmall {
    return _baseMainTextStyle.copyWith(
      fontSize: FontSizeTheme.bodySmall.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }
}
