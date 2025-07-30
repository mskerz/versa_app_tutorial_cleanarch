import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/state/button_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/state/navigator_notifier.dart';

final transitionProvider =
    StateNotifierProvider<AnimateTransitionNotifier, IndicatorState>(
        (ref) => AnimateTransitionNotifier());

final buttonNotifierProvider =
    StateNotifierProvider<ButtonNotifier, int>((ref) => ButtonNotifier());

final activeIndexProvider = StateProvider<int>((ref) => 0);

class UIInstanceProvider {
  final WidgetRef ref;
  UIInstanceProvider(this.ref);
  AppThemeModeNotifier get themeNotifier => ref.read(appThemeProvider.notifier);
    ThemeMode get themeMode => ref.read(appThemeProvider);
   AnimateTransitionNotifier get transionNotifier =>
      ref.watch(transitionProvider.notifier);
  IndicatorState get transionNavigator => ref.watch(transitionProvider);
  ButtonNotifier get buttonNotifier =>
      ref.watch(buttonNotifierProvider.notifier);
  int get activeIndex => ref.watch(activeIndexProvider);
}
