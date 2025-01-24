import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.success(List<Notify> notifications) = _Success;
  const factory NotificationState.failure(VersaException excepiton) = _Failure;
  const factory NotificationState.empty() = _Empty;
}

