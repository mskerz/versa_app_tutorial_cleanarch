import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/paginated_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class TokenRepository {
  Future<Either<VersaException, PaginatedResponse>> fetchToken( {required int  skip}); // Future<Either<VersaException, List<Token>>> fetchToken();
  Future<Either<VersaException, List<Token>>> fetchTokenbyStatus(
      String tokenStatus);
}
