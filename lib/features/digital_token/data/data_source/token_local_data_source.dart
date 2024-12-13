import 'dart:convert';

import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class TokenLocalDataSource extends TokenDataSource {
  final StorageService storageService;

  TokenLocalDataSource(this.storageService);

  @override
  Future<Either<AppException, List<Token>>> fetchToken() async {
     try {
      // โหลด JSON จากไฟล์ mockup
      final rawJson = await storageService.loadJson();
      if (rawJson == null) {
        // ถ้าไฟล์ JSON เป็น null ให้ส่งค่าผลลัพธ์เป็น Left
         return Left(
          AppException(
            message: 'Failed to load tokens from local storage',
            statusCode: 404,
            identifier: "TokenLocalDatasource",
          ),
        );
      }

      // แปลง JSON ที่ได้เป็น Map หรือ List ของ Token
      final tokenJson = json.decode(rawJson);
      // กรองข้อมูลโดยใช้ tokenStatus ที่ได้รับมา
      final tokens = (tokenJson['tokens'] as List)
          .map((json) => Token.fromJson(json))
          .toList();
      print("token  result: $tokens");
      // ส่งกลับผลลัพธ์ใน Right
      return Right(tokens);
    } catch (e) {
      // ถ้าเกิดข้อผิดพลาดในการประมวลผล ให้ส่งค่าผลลัพธ์เป็น Left
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 500,
          identifier: 'TokenLocalDatasourceError',
        ),
      );
    }
  }

  Future<Either<AppException, TokenList>> filterToken(
      {required String tokenStatus}) async {
    try {
      // โหลด JSON จากไฟล์ mockup
      final rawJson = await storageService.loadJson();
      if (rawJson == null) {
        // ถ้าไฟล์ JSON เป็น null ให้ส่งค่าผลลัพธ์เป็น Left
        return Left(
          AppException(
            message: 'Failed to load tokens from local storage',
            statusCode: 404,
            identifier: "TokenLocalDatasource",
          ),
        );
      }

      // แปลง JSON ที่ได้เป็น Map หรือ List ของ Token
      final tokenJson = jsonDecode(rawJson.toString());

      // กรองข้อมูลโดยใช้ tokenStatus ที่ได้รับมา
      final filteredTokens = (tokenJson as List)
          .where((token) => token['status'] == tokenStatus)
          .map((json) => Token.fromJson(json))
          .toList();
      print("token status: $tokenStatus - result: $filteredTokens");
      // ส่งกลับผลลัพธ์ใน Right
      return Right(filteredTokens);
    } catch (e) {
      // ถ้าเกิดข้อผิดพลาดในการประมวลผล ให้ส่งค่าผลลัพธ์เป็น Left
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 500,
          identifier: 'TokenLocalDatasourceError',
        ),
      );
    }
  }
}
