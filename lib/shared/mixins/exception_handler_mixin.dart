import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/response.dart' as response;
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/network_service.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<VersaException, response.Response>> handleException<T extends Object>(
    Future<Response<dynamic>> Function() handler, {
    String endpoint = '',
  }) async {
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
      String? additionalInfo;

      log(e.runtimeType.toString());

      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at $endpoint';
          additionalInfo = 'No network connection';
          break;

        case DioException:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = e.response?.statusCode ?? 500;
          identifier = 'DioException ${e.message} \nat $endpoint';
          additionalInfo = e.message; // ใช้ข้อความจาก DioException เป็นข้อมูลเสริม
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
          additionalInfo = e.toString(); // เพิ่มข้อมูลเสริมจากข้อผิดพลาดโดยตรง
      }


      return Left(
        VersaException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
