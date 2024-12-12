import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/globals.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_colors.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/text_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(storageServiceProvider);
    return AppThemeModeNotifier(storage);
  },
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentTheme() async {
    final theme = await storageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }
}

class AppTheme {
  // Dark theme data of the app
  static ThemeData get darkTheme {
    return ThemeData(
      
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.appBarColor, // เปลี่ยนสีของ app bar
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary, // เปลี่ยน secondary color
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.appBarColor, // เปลี่ยนสีของ app bar
      ),
    );
  }
}
