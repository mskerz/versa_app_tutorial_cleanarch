import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/notifier/stepper_notifier.dart';

final genderProvider = StateProvider<String>((ref) => 'Male');
final showOtherGenderFieldProvider = StateProvider<bool>((ref) => false);
final passwordVisibilityProvider = StateProvider<bool>((ref) => true);
final confirmPasswordVisibilityProvider = StateProvider<bool>((ref) => true);


// สร้าง Provider สำหรับ Step
final stepProvider = StateNotifierProvider<StepStateNotifier, int>((ref) {
  return StepStateNotifier();
});
