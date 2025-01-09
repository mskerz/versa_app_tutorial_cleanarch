import 'package:equatable/equatable.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/response.dart';

class VersaException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  VersaException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override

  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}


class CacheFailureException extends Equatable implements VersaException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on VersaException {
  Left<VersaException, Response> get toLeft => Left<VersaException, Response>(this);
}

