import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class Response {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  Response(
      {required this.statusCode, this.statusMessage, this.data = const {}});
  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
