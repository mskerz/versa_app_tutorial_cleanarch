import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/form_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/form_register.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

import 'package:versa_app_tutorial_cleanarch/shared/constants/assets_app.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final Map<String, TextEditingController> controllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'phoneNumber': TextEditingController(),
    'age': TextEditingController(),
    'gender': TextEditingController(),
    // เพิ่มฟิลด์อื่นๆ ตามต้องการ
  };
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  // สร้างฟังก์ชันสำหรับแสดง error snackbar

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final step = ref.read(stepProvider.notifier);
    void CallRegister(User userCreate) {
      // ทำการประมวลผลกับ User ที่ถูกส่งมา
      // print('User Registered: ${userCreate.firstName} ${userCreate.gender}');
      // print("Image: ${userCreate.image}");
      // ตัวอย่างการทำงาน: ส่งข้อมูลไปยัง API หรือบันทึกข้อมูล
      authNotifier.signup(userCreate);
    }

    // ฟังการเปลี่ยนแปลงสถานะของ loginNotifierProvider
    ref.listen(authNotifierProvider, (previous, next) {
      // เมื่อสถานะเปลี่ยนเป็น failure ให้แสดง snackbar แสดงข้อผิดพลาด
      if (next is Failure) {
        if (next.exception.statusCode == 400) {
          authNotifier.showErrorSnackBar(
              "อีเมลนี้มีผู้ใช้งานแล้ว กรุณาใช้อีเมลอื่น",
              context);
          step.previousStep();
        }
      }

       // เมื่อสถานะเป็น success (ล็อกอินสำเร็จ)
      else if (next is Success) {
        // แสดงบาร์การโหลด (Circle Indication Bar)
        
        authNotifier.showSuccessSnackbar("ลงทะเบียนสำเร็จ", context);

        context.router.replace( LoginRoute());
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              LIGHT_LOGO_IMG,
              width: 200,
            ),
           

            RegisterForm(
              controllers: controllers, // ส่ง controllers ไปยัง RegisterForm
              formKey: formKey, onRegister: CallRegister, // ส่ง formKey ไปยัง RegisterForm
            ),
            SizedBox(height: 15),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
// ลบ controller เมื่อ widget หายไป
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }
}
