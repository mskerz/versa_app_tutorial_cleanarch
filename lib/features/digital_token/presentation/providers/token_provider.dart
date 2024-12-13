

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_list_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_tab_state.dart';

final selectedTabIndexProvider = StateNotifierProvider<TokenTabStateNotifier, int>((
  ref) => TokenTabStateNotifier()
);

final tokenNotifierProvider = StateNotifierProvider<TokenNotifier,TokenState>((ref){

  final repository = ref.watch(tokenRepositoryProvider);
  return TokenNotifier(repository);

});
