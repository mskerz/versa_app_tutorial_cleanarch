import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/state/button_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/state/navigator_notifier.dart';

final transitionProvider =
    StateNotifierProvider<AnimateTransitionNotifier, IndicatorState>(
        (ref) => AnimateTransitionNotifier());

final buttonNotifierProvider =
    StateNotifierProvider<ButtonNotifier, int>((ref) => ButtonNotifier());
