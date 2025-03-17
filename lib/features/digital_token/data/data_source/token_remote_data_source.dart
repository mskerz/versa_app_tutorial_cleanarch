
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
  Future<Either<VersaException, PaginatedResponse>> fetchToken(
      {required int skip}) async {
    final response = await networkService.get('/token', queryParameters: {
      'skip': skip,
      'limit': ITEM_PER_PAGE,
    });
    return response.fold((fail) => Left(fail), (response) {
      final jsonData = response.data;
      if (jsonData == null) {
        return Left(
          VersaException(
            identifier: 'fetchPaginatedData',
            statusCode: 0,
            message: 'The data is not in the valid format.',
          ),
        );
      }
      print(jsonData['data']);
      final paginateResponse =
          PaginatedResponse.fromJson(jsonData, jsonData['data']);
      return Right(paginateResponse);
    });
  }

  @override
  Future<Either<VersaException, List<Token>>> filterToken(
      {required String tokenStatus}) {
    // TODO: implement filterToken
    throw UnimplementedError();
  }

  @override
  Future<Either<VersaException, Token>> getTokenOne(String symbol) {
    // TODO: implement getTokenOne
    throw UnimplementedError();
  }
}
