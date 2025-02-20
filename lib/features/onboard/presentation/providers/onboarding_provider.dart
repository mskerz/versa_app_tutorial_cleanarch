

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/onboard_notifier.dart';

final onboardProvider = StateNotifierProvider<OnboardNotifier, int>((ref) {
  return OnboardNotifier();
});
