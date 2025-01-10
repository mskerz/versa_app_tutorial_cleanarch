
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class AuthRepository {
    Future<Either<VersaException, void>> signin(String email, String password);
    Future<Either<VersaException,void>> signup(User user );
    Future<Either<VersaException,UserResponse>> verifyUser();

}