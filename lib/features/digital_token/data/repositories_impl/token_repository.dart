
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/repositories/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/parse_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class TokenRepositoryImpl  implements TokenRepository{
  final TokenDataSource tokenDataSource ;
  
  TokenRepositoryImpl(this.tokenDataSource);
  @override

  Future<Either<AppException, List<Token>>> fetchTokenbyStatus(String tokenStatus) async {
    // TODO: implement fetchTokenbyStatus
  
    return await tokenDataSource.filterToken(tokenStatus: tokenStatus);
  }

    // Future<Either<AppException, List<Token>>> fetchToken() async{
    //   return await tokenDataSource.fetchToken();
    // }

  @override
  Future<Either<AppException, ParseResponse<List<Token>>>> fetchTokenList() async{
    // TODO: implement fetchTokenList
    final data = await tokenDataSource.fetchToken();
    return data;
  }
  
  @override
  Future<Either<AppException, List<Token>>> fetchToken() {
    // TODO: implement fetchToken
    throw UnimplementedError();
  }
  
}