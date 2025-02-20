


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/notifier/token_list_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_state.dart';

import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/state/button_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

 

final tokenNotifierProvider = StateNotifierProvider<TokenNotifier,TokenState>((ref){

  final repository = ref.watch(tokenRepositoryProvider);
  return TokenNotifier(repository);

});


class TokenInstanceProvider {

  final WidgetRef ref;

TokenInstanceProvider(this.ref);

  TokenNotifier get notifier => ref.read(tokenNotifierProvider.notifier);
  TokenState get tokenState => ref.watch(tokenNotifierProvider);
  
List<Token> get tokenData => tokenState.maybeWhen(
  success: (tokens, page, total) => tokens, // Extract the 'tokens' from the success state
  orElse: () => [], // Return an empty list if the state is not success
);

  ButtonNotifier get buttonNotifier => ref.read(buttonNotifierProvider.notifier);
  int get selectedButtonIndex => ref.watch(buttonNotifierProvider);



}