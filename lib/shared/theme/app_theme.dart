import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/globals.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_colors.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_wallet_color.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/text_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'extension/app_theme_gradient_extension.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(storageServiceProvider);
    return AppThemeModeNotifier(storage);
  },
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.dark) {
    getCurrentTheme();
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    save();
  }

  void getCurrentTheme() async {
    final theme = await storageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }

  void changeDarkTheme() {
    state = ThemeMode.dark;
    save();
  }

  void changeLightTheme() {
    state = ThemeMode.light;
    save();
  }

  void save() {
    storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }
}

class AppTheme {
  // Dark theme data of the app
  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xFF121212),
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
        textTheme: TextThemes.darkTextTheme,
        primaryTextTheme: TextThemes.darkTextTheme,
        inputDecorationTheme:
            InputDecorationTheme(fillColor: AppColors.filledTextFleidColorDark),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          surfaceTintColor: Color(0xFF252525),
          splashFactory: NoSplash.splashFactory,
        )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0x66FFFFFF),
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 13),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 13),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 2,
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.symmetric(horizontal: 1),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.backgroundDarkBlue, // เปลี่ยนสีของ app bar
          titleTextStyle: AppTextStyles.h2,
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent

                // ใส่ฟอนต์และขนาด
                )),
        extensions: [
          WalletColorExtension(
              colorWalletItemButton: AppColors.walletButtonColorDark,
              gradientWalletContainer:
                  GradientAppColors.walletContainerGradientDark,
              gradientWalletContainerBorder:
                  GradientAppColors.walletContainerBorderGradientDark),
          GradientBackgroundExtention(
              gradientBackground:
                  GradientAppColors.gradientVersaDarkBlackground,
              gradientContainerPrimary: GradientAppColors.gradientSweepDark,
              gradientContainerSecondary: GradientAppColors.gradientSweepLight,
              gradientBottomBar: GradientAppColors.gradientBottomBarDark,
              gradientFloatingButton:
                  GradientAppColors.floatingButtonGradientDark,
              gradientFloatingButtonBorder:
                  GradientAppColors.floatingBorderButtonGradientDark,
              gradientBlackgroundIcon:
                  GradientAppColors.circleBackgroundMenuIconDark),
        ]);
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        brightness: Brightness.light,
        primaryColor: AppColors.black,
        textTheme: TextThemes.primaryTextTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColors.filledTextFleidColorLight),
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
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Color.fromARGB(255, 189, 189, 189),
          splashFactory: NoSplash.splashFactory,
        )),
        
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: AppColors.greyBlue,
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 13),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 13),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent
              // ใส่ฟอนต์และขนาด
              ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.symmetric(horizontal: 1),
        ),
        extensions: [
          WalletColorExtension(
              colorWalletItemButton: AppColors.walletButtonColorLight,
              gradientWalletContainer:
                  GradientAppColors.walletContainerGradientLight,
              gradientWalletContainerBorder:
                  GradientAppColors.walletContainerBorderGradientLight),
          GradientBackgroundExtention(
              gradientBackground:
                  GradientAppColors.gradientVersaLightBlackground,
              gradientContainerPrimary: GradientAppColors.gradientSweepLight,
              gradientContainerSecondary: GradientAppColors.gradientSweepDark,
              gradientBottomBar: GradientAppColors.gradientBottomBarLight,
              gradientFloatingButton:
                  GradientAppColors.floatingButtonGradientLight,
              gradientFloatingButtonBorder:
                  GradientAppColors.floatingBorderButtonGradientLight,
              gradientBlackgroundIcon:
                  GradientAppColors.circleBackgroundMenuIconLight),
        ]);
  }
}
