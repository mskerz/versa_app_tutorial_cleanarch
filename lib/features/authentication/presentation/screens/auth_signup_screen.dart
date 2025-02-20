import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/form_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/register/form_register.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

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
    final ui = UIInstanceProvider(ref);
    final step = ref.read(stepProvider.notifier);
    final themeMode = ui.themeMode;
    final themeNotifier = ui.themeNotifier;

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
              "อีเมลนี้มีผู้ใช้งานแล้ว กรุณาใช้อีเมลอื่น", context);
          step.previousStep();
        }
      }

      // เมื่อสถานะเป็น success (ล็อกอินสำเร็จ)
      else if (next is Success) {
        // แสดงบาร์การโหลด (Circle Indication Bar)

        authNotifier.showSuccessSnackbar("ลงทะเบียนสำเร็จ", context);

        context.router.replace(LoginRoute());
      }
    });
    return AppScaffold(
      isVisibleBottomBar: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign Up",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                themeNotifier.toggleTheme();
              },
              icon: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                    : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: AppBodyWithGredient(
        removeFixedPadding: true,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                child: RegisterForm(
                  controllers:
                      controllers, // ส่ง controllers ไปยัง RegisterForm
                  formKey: formKey,
                  onRegister: CallRegister, // ส่ง formKey ไปยัง RegisterForm
                ),
              ),
              SizedBox(height: 15),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
