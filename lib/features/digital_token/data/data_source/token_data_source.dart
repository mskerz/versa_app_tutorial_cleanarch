import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/paginated_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class TokenDataSource {
  Future<Either<AppException, PaginatedResponse>> fetchToken({required int skip});
  Future<Either<AppException,List<Token>>> filterToken({required String tokenStatus});
  Future<Either<AppException,Token>> getTokenOne(String symbol);
}


 