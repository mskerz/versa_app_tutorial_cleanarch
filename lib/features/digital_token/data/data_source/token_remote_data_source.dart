import 'dart:convert';

import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/parse_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class TokenRemoteDataSource extends TokenDataSource {
  final NetworkService networkService;

  TokenRemoteDataSource(this.networkService);
  @override
  Future<Either<AppException, ParseResponse<List<Token>>>> fetchToken() async {
    final response = await networkService.get('/token');

    return response.fold((exception) => Left(exception), (res) {
      final parseResponse = ParseResponse<List<Token>>.fromMap(
        res.data,
        modifier: (json) {
            final data = json['tokens'] as List<dynamic>; // List<dynamic> since the tokens are an array of objects
            print("$data");
            final tokens = (json['tokens'] as List).map((json) => Token.fromJson(json)).toList();
            return tokens;
        },
      );
      if(parseResponse.success){
        return Right(parseResponse);
      }else{
        return Left(AppException(
            message: parseResponse.message ?? 'Unknown error',
            statusCode: res.statusCode,
          identifier: 'API Error',

            
        ));
      }

      
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
