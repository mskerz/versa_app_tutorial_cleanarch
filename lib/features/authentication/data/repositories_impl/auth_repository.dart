import 'package:versa_app_tutorial_cleanarch/features/authentication/data/data_source/auth_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/domain/repositories/auth_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthDataSource authDataSource;
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<VersaException, void>> signin(String email, String password)async {
    // TODO: implement signin
     return authDataSource.signin(email, password);
  }

  @override
  Future<Either<VersaException, void>> signup(User user)async {
    // TODO: implement signup
    return await authDataSource.signup(user);
  }

  @override
  Future<Either<VersaException, UserResponse>> verifyUser()async {
    // TODO: implement verifyUser
    return await authDataSource.verifyUser();
  }}

  