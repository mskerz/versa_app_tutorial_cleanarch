import 'package:versa_app_tutorial_cleanarch/features/authentication/data/data_source/auth_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/login_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class AuthLocalDataSource implements AuthDataSource {
  @override
  Future<Either<VersaException, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<VersaException, LoginResponse>> signin(String email, String password) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override

  Future<Either<VersaException, void>> signup(User user) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either<VersaException, UserResponse>> verifyUser() {
    // TODO: implement verifyUser
    throw UnimplementedError();
  }
  
  @override
  Future<Either<VersaException, bool>> hasAccessTokenNotExpired() {
    // TODO: implement hasAccessToken
    throw UnimplementedError();
  }
}