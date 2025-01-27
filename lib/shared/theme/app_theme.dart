import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/globals.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_colors.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/text_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme_extension.dart';

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
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.primary, // กำหนดสีของแท็บที่เลือก
          tabAlignment: TabAlignment.start,

          unselectedLabelColor:
              AppColors.lightGrey, // กำหนดสีของแท็บที่ไม่ได้เลือก
          indicatorColor: Colors.orange, // กำหนดสีของ indicator
          labelPadding: EdgeInsets.symmetric(horizontal: 20), // เพิ่ม padding
          indicator: MaterialIndicator(
            color: Colors.orange,
            height: 5,
            topLeftRadius: 8,
            topRightRadius: 8,
            horizontalPadding: 50,
            tabPosition: TabPosition.bottom,
          ),
          labelStyle:
              GoogleFonts.prompt(textStyle: TextStyle(fontSize: 18.0)), // ฟอนต์
          unselectedLabelStyle:
              GoogleFonts.prompt(textStyle: TextStyle(fontSize: 18.0)), // ฟอนต์
        ),
        colorScheme: const ColorScheme.dark(
            primary: AppColors.secondary,
            onPrimary: AppColors.backgroundDarkBlue,
            secondary: AppColors.backgroundDarkBlue,
            surface: AppColors.backgroundNavyBlue,
            onSurface: AppColors.backgroundContainerDark,
            primaryContainer: AppColors.lightBlue,
            secondaryContainer: AppColors.lightSkyBlue,
            error: AppColors.error,
            inversePrimary: AppColors.primary),
        scaffoldBackgroundColor: AppColors.backgroundDarkBlue,
        textTheme: TextThemes.textTheme,
        primaryTextTheme: TextThemes.darkTextTheme,
        appBarTheme: AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.backgroundDarkBlue, // เปลี่ยนสีของ app bar
          titleTextStyle: AppTextStyles.h2,
        ),
        extensions: const [
          GradientBackgroundExtention(
            gradientBackground: AppColors.gradientDarkBlue,
     gradientContainerPrimary: AppColors.gradientSecondary,
            gradientContainerSecondary: AppColors.gradientPrimary,
          ),
        ]);
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        brightness: Brightness.light,
        primaryColor: AppColors.black,
        textTheme: TextThemes.textTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.black, // กำหนดสีของแท็บที่เลือก
          tabAlignment: TabAlignment.start,

          unselectedLabelColor:
              AppColors.lightGrey, // กำหนดสีของแท็บที่ไม่ได้เลือก
          indicatorColor: Colors.orange, // กำหนดสีของ indicator
          labelPadding: EdgeInsets.symmetric(horizontal: 20), // เพิ่ม padding
          indicator: MaterialIndicator(
            color: AppColors.lightBlue,
            height: 5,
            topLeftRadius: 8,
            topRightRadius: 8,
            horizontalPadding: 50,
            tabPosition: TabPosition.bottom,
          ),
          labelStyle:
              GoogleFonts.prompt(textStyle: TextStyle(fontSize: 18.0)), // ฟอนต์
          unselectedLabelStyle:
              GoogleFonts.prompt(textStyle: TextStyle(fontSize: 18.0)), // ฟอนต์
        ),
        colorScheme: const ColorScheme.light(
            primary: AppColors.backgroundDarkBlue,
            onPrimary: AppColors.primary,
            secondary: AppColors.secondary, // เปลี่ยน secondary color
            primaryContainer: AppColors.lightGrey,
            surface: AppColors.primary,
            onSurface: AppColors.backgroundContainerLight,
            secondaryContainer: AppColors.lightWhiteGrey,
            error: AppColors.error,
            inversePrimary: AppColors.secondary),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.black,

          backgroundColor: AppColors.primary, // เปลี่ยนสีของ app bar
        ),
        extensions: const [
          GradientBackgroundExtention(
            gradientBackground: AppColors.gradientOrange,
            gradientContainerPrimary: AppColors.gradientPrimary,
            gradientContainerSecondary: AppColors.gradientSecondary,
          ),
        ]);
  }
}
