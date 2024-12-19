import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/parse_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class TokenDataSource {
  Future<Either<AppException, ParseResponse<List<Token>>>> fetchToken();
  Future<Either<AppException,List<Token>>> filterToken({required String tokenStatus});
  Future<Either<AppException,Token>> getTokenOne(String symbol);
}


 