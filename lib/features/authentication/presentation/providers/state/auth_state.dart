import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

part 'auth_state.freezed.dart'; // สร้างไฟล์ .freezed.dart


@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.failure(VersaException exception) = Failure;
  const factory AuthState.success([UserResponse? userResponse]) = Success;
}
