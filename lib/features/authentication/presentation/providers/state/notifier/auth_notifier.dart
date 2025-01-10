import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/domain/repositories/auth_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(AuthState.initial());

  Future<void> signin(String email, String password) async {
    final result = await authRepository.signin(email, password);

    result.fold(
      (exception) {
        state = AuthState.failure(exception);
      },
      (loginResponse) {
        state = AuthState.success();
      },
    );
  }
  Future<void> signup(User user) async{
    final result = await authRepository.signup(user);

    result.fold(
      (exception) {
        state = AuthState.failure(exception);
      },
      (_) {
        state = const AuthState.success();
      },
    ); 
  }

  Future<void> verify()async {
    final result = await authRepository.verifyUser();
    result.fold(
      (exception) {
        state = AuthState.failure(exception);
      },
      (response) {

        // insert the code 
       },
    ); 
  }



  void showErrorSnackBar(String err_message,BuildContext context) {
    // นำการแสดงผล Dialog มาแสดงใน UI
    // ใช้ตัวจัดการแสดงผล Dialog ของคุณ เช่น `showDialog`
    
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(err_message,style: GoogleFonts.prompt(color: Colors.white),)),
          ],
        ),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSuccessSnackbar(String success,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(success, style: GoogleFonts.prompt(color: Colors.white),)),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
