import 'package:versa_app_tutorial_cleanarch/features/authentication/data/data_source/auth_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/login_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class AuthRemoteDataSource implements AuthDataSource {
  final NetworkService networkService;
  final StorageService storageService;
  // Constructor with NetworkService injected
  AuthRemoteDataSource(this.networkService, this.storageService);

  @override
  Future<Either<VersaException, void>> signin(
      String email, String password) async {
    try {
      final loginData = {'email': email, 'password': password};

      final eitherResponse =
          await networkService.post('/auth/signin', data: loginData);
      return eitherResponse.fold((exception) {
        return Left(exception);
      }, (response) async {
        final loginResponse = LoginResponse.fromJson(response.data);
        await storageService.set("accessToken", loginResponse.idToken!);

        await storageService.set("refreshToken", loginResponse.refreshToken!);
        return Right(null); // On success, return the LoginResponse
      });
    } catch (e) {
      // หากเกิดข้อผิดพลาดจาก network หรือกรณีอื่นๆ
      print(e.toString());
      return Left(
        VersaException(
          message: 'An error occurred during sign in: ${e.toString()}',
          statusCode: 1,
          identifier: 'Network error',
        ),
      );
    }
  }

  @override
  Future<Either<VersaException, void>> signup(User user) async {
    // TODO: implement signup
    try {
      final bodyJson = {
        'email': user.email,
        'firstname': user.firstName,
        'lastname': user.lastName,
        'password': user.password,
        'age': user.age,
        'phoneNumber': user.phoneNumber,
        'gender': user.gender,
        'image': user.image
      };
      final eitherResponse =
          await networkService.post('/auth/signup', data: bodyJson);
      return eitherResponse.fold((exception) => Left(exception), (response) {
        return Right(null); // On success, return null
      });
    } catch (e) {
      return Left(
        VersaException(
          message: 'An error occurred during sign in: ${e.toString()}',
          statusCode: 1,
          identifier: 'Network error',
        ),
      );
    }
  }

  @override
  Future<Either<VersaException, UserResponse>> verifyUser() async {
    // TODO: implement verifyUser
    final eitherResponse = await networkService.get('/auth/verify');
    return eitherResponse.fold((exception) {
      return Left(exception);
    }, (response) {
      final userResponse = UserResponse.fromJson(response.data);
      print(userResponse.user);
      return Right(userResponse); // On success, return null
    });
  }

  @override
  Future<Either<VersaException, void>> logout() async {
    try {
      // เรียก API POST สำหรับ logout
      final eitherResponse = await networkService.post('/auth/signout');

      // ใช้ fold เพื่อจัดการผลลัพธ์จาก eitherResponse
      return eitherResponse.fold(
        (exception) {
          // ถ้ามี exception ก็ส่งกลับ Left
          return Left(exception);
        },
        (_) async {
          // เมื่อ logout สำเร็จ, ลบ accessToken และ refreshToken ออกจาก storage
          
          var tokenisNotExist = await storageService.remove("accessToken");
          
          if(tokenisNotExist){
            print("token does not exist");
          }
          print(tokenisNotExist);
          // คืนค่า Right(null) เพื่อแสดงว่า logout สำเร็จ
          return Right(null);
        },
      );
    } catch (e) {
      // หากเกิดข้อผิดพลาดอื่นๆ ในกระบวนการ (เช่น network error), คืนค่า Left
      return Left(
        VersaException(
          message: 'An error occurred during sign out: ${e.toString()}',
          statusCode: 1,
          identifier: 'Network error',
        ),
      );
    }
  }
}
