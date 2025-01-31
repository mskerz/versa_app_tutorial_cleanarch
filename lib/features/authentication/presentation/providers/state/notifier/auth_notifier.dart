import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/domain/repositories/auth_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  // คอนสตรัคเตอร์ของ AuthNotifier
  AuthNotifier(this.authRepository) : super(AuthState.initial()) {
    // เรียกใช้ฟังก์ชัน init() เพื่อทำการเช็คสถานะการล็อกอิน
    _init();
  }
  // ฟังก์ชัน _init() ที่ทำงานแบบ async

  Future<void> _init() async {
    await _checkAuthStatus(); // เช็คสถานะการล็อกอิน
  }

  Future<void> _checkAuthStatus() async {
    // ตรวจสอบว่ามี token หรือไม่

    final stopwatch = Stopwatch(); // เริ่มจับเวลา
    stopwatch.start(); // เริ่มจับเวลา
    final checkToken = await authRepository
        .hasToken(); // ฟังก์ชันที่จะดึง token จาก local storage
    checkToken.fold((e) {
      state = AuthState.failure(e);
    }, (hasTokenNotExpired) async {
      if (hasTokenNotExpired) {
        // count time ตอนเรียกข้อมูล
     state = AuthState.loading(); // เปลี่ยนสถานะเป็น loading

        Future.delayed(Duration(seconds: 2),()async{
                  await verify();


        });
      } else {
        state = AuthState.initial(); // เปลี่ยนสถานะเป็น loggedOut
        print('state token expired :  $hasTokenNotExpired');
      }
    });

    stopwatch.stop(); // หยุดจับเวลา
    print(
        'Time taken: ${stopwatch.elapsedMilliseconds} ms'); // แสดงเวลาที่ใช้ในการเรียกข้อมูล
  }

  Future<void> signin(String email, String password) async {
    final result = await authRepository.signin(email, password);

    result.fold(
      (exception) {
        state = AuthState.failure(exception);
      },
      (_) {
        state = AuthState.success();

        verify();
      },
    );
  }

  Future<void> signup(User user) async {
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

  Future<void> verify() async {
    final result = await authRepository.verifyUser();
    result.fold(
      (exception) {
        state = AuthState.failure(exception);
      },
      (response) {
        final updatedResponse = response.copyWith(isloggedIn: true);
        print("Updated UserResponse: ${updatedResponse.isloggedIn}");
        state = AuthState.success(updatedResponse);
      },
    );
  }

  // ฟังก์ชันสำหรับ signout
  Future<void> signout(BuildContext context) async {
    final result = await authRepository.signout();

    result.fold(
      (exception) {
        state = AuthState.failure(exception);
        showErrorSnackBar("Logout failed",
            context); // แสดง error snackbar ถ้า signout ล้มเหลว
      },
      (_) {
        state = AuthState.initial(); // รีเซ็ตสถานะเมื่อ signout สำเร็จ
        showSuccessSnackbar("Logout successful",
            context); // แสดง success snackbar ถ้า signout สำเร็จ
      },
    );
  }

  void showErrorSnackBar(String err_message, BuildContext context) {
    // นำการแสดงผล Dialog มาแสดงใน UI
    // ใช้ตัวจัดการแสดงผล Dialog ของคุณ เช่น `showDialog`

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              err_message,
              style: GoogleFonts.prompt(color: Colors.white),
            )),
          ],
        ),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSuccessSnackbar(String success, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              success,
              style: GoogleFonts.prompt(color: Colors.white),
            )),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
