import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/response.dart'
    as response;
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException e:
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException e:
          switch (e.type) {
            case DioExceptionType.cancel:
              message = 'Request to API was cancelled.';
              statusCode = 408; // Request Timeout
              identifier = 'DioErrorType.cancel at $endpoint';
              break;

            case DioExceptionType.connectionTimeout:
              message = 'Connection timeout with API server.';
              statusCode = 408; // Request Timeout
              identifier = 'DioErrorType.connectionTimeout at $endpoint';
              break;

            case DioExceptionType.receiveTimeout:
              message = 'Receive timeout in connection with API server.';
              statusCode = 504; // Gateway Timeout
              identifier = 'DioErrorType.receiveTimeout at $endpoint';
              break;

            case DioExceptionType.sendTimeout:
              message = 'Send timeout in connection with API server.';
              statusCode = 408; // Request Timeout
              identifier = 'DioErrorType.sendTimeout at $endpoint';
              break;

            case DioExceptionType.badCertificate:
              message = 'Bad certificate error.';
              statusCode = 500; // Internal Server Error
              identifier = 'DioErrorType.badCertificate at $endpoint';
              break;

            case DioExceptionType.badResponse:
              // Handle the case when the response contains an error
              if (e.response != null) {
                message = e.response?.data?['message'] ??
                    'Received invalid status code: ${e.response?.statusCode}';
                statusCode = e.response?.statusCode ??
                    500; // Default to Internal Server Error if statusCode is null
              } else {
                message = 'Received invalid response from the server.';
                statusCode = 500; // Internal Server Error
              }
              identifier = 'DioErrorType.badResponse at $endpoint';
              break;

            case DioExceptionType.connectionError:
              message = 'Network connection error occurred.';
              statusCode = 0; // No connection (network issue)
              identifier = 'DioErrorType.connectionError at $endpoint';
              break;

            case DioExceptionType.unknown:
              message = 'An unknown error occurred.';
              statusCode = 500; // Internal Server Error
              identifier = 'DioErrorType.unknown at $endpoint';
              break;
          }
          break;
        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
