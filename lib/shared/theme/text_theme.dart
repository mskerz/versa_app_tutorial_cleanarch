import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_colors.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.body,
      titleMedium: AppTextStyles.bodySm,
      titleSmall: AppTextStyles.bodyXs,
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.black),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.black),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.black),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.black),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.black),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.black),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.black),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.primary),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.primary),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.primary),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.primary),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.primary),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.primary),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.primary),
    );
  }
}
