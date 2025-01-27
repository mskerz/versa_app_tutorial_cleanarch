

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/domain/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/notifier/auth_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

// สร้าง StateNotifierProvider สำหรับ LoginNotifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider); // รับ AuthRepository
    return AuthNotifier(authRepository);
  },
);

final rememberPasswordProvider = StateProvider<bool>((ref) => false);


final userProvider = Provider<User?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    success: (userResponse) => userResponse?.user,
    orElse: () => null,
  );
});

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    success: (userResponse) => userResponse?.isloggedIn ?? false,
    orElse: () => false,
  );
});


final isInitialProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    initial: ()=> true,
    orElse: () => false,
  );
});
