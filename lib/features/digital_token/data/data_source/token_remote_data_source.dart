
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/paginated_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';
import 'package:versa_app_tutorial_cleanarch/shared/globals.dart';

class TokenRemoteDataSource extends TokenDataSource {
  final NetworkService networkService;

  TokenRemoteDataSource(this.networkService);
  @override
  Future<Either<AppException, PaginatedResponse>> fetchToken(
      {required int skip}) async {
    final response = await networkService.get('/token', queryParameters: {
      'skip': skip,
      'limit': ITEM_PER_PAGE,
    });
    return response.fold((fail) => Left(fail), (response) {
      final jsonData = response.data;
      print("log - $jsonData");
      if (jsonData == null) {
        return Left(
          AppException(
            identifier: 'fetchPaginatedData',
            statusCode: 0,
            message: 'The data is not in the valid format.',
          ),
        );
      }
      final paginateResponse =
          PaginatedResponse.fromJson(jsonData, jsonData['data']);
      return Right(paginateResponse);
    });
  }

  @override
  Future<Either<AppException, List<Token>>> filterToken(
      {required String tokenStatus}) {
    // TODO: implement filterToken
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, Token>> getTokenOne(String symbol) {
    // TODO: implement getTokenOne
    throw UnimplementedError();
  }
}
