import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

part 'token_state.freezed.dart';

@freezed
class TokenState with _$TokenState {
  const factory TokenState.initial() = _Initial;
  const factory TokenState.loading() = _Loading;
  const factory TokenState.success(List<Token> tokens, int page, int total) = _Success;
  const factory TokenState.failure(VersaException exception) = _Failure;
  const factory TokenState.empty() = _Empty;
}
