


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/notifier/token_list_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_list_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/notifier/token_tab_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/state/button_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/ui_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

final selectedTabIndexProvider = StateNotifierProvider<TokenTabStateNotifier, int>((
  ref) => TokenTabStateNotifier()
);

final tokenNotifierProvider = StateNotifierProvider<TokenNotifier,TokenState>((ref){

  final repository = ref.watch(tokenRepositoryProvider);
  return TokenNotifier(repository);

});


class TokenInstanceProvider {
  final WidgetRef ref;

  TokenInstanceProvider(this.ref);


  TokenState get tokenState => ref.watch(tokenNotifierProvider);
  
  List<Token> get tokenData => tokenState.tokenList;

  ButtonNotifier get buttonNotifier => ref.read(buttonNotifierProvider.notifier);
  int get selectedButtonIndex => ref.watch(buttonNotifierProvider);



}