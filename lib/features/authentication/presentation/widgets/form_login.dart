import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/form_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/login/login_button_container.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/login/login_textfied.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets_app.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class SignInForm extends ConsumerStatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final AuthProviderInstance? instance;

  const SignInForm(
      {super.key,
      this.emailController,
      this.passwordController,
      this.instance});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  bool obscurePassword = true; // State for password visibility

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.read(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final showPassword = ref.watch(loginPasswordVisibilityProvider);
    final auth = widget.instance!;

    final authNotifier = widget.instance!.notifier;

    // ฟังการเปลี่ยนแปลงสถานะของ loginNotifierProvider

    ref.listen(authNotifierProvider, (previous, next) {
      // เมื่อสถานะเปลี่ยนเป็น failure ให้แสดง snackbar แสดงข้อผิดพลาด
      if (next is Failure) {
        if (next.exception.statusCode == 400) {
          authNotifier.showErrorSnackBar(
              "Your email or password is incorrect. Please try again.",
              context);
        }
      }

      // เมื่อสถานะเป็น success (ล็อกอินสำเร็จ)
      else if (next is Success) {
        // แสดงบาร์การโหลด (Circle Indication Bar)
        showDialog(
          context: context,
          barrierDismissible: false, // ไม่ให้ปิด Dialog โดยการแตะนอก
          builder: (context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 300),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          },
        );

        // หน่วงเวลา 2 วินาที ก่อนที่จะทำการนำทาง
        Future.delayed(const Duration(seconds: 2), () {
          // ปิด Dialog เมื่อหน่วงเวลาหมด
          if (context.mounted) {
            // ปิด Dialog เมื่อหน่วงเวลาหมด
            Navigator.of(context).pop();

            // ทำการนำทางไปยังหน้า Home
            context.router.replace(const HomeRoute());
          }
        });
      }
    });

    void signinButton() async {
      final email = widget.emailController?.text.trim() ?? '';
      final password = widget.passwordController?.text.trim() ?? '';

      // Check if email or password is empty
      if (email.isEmpty || password.isEmpty) {
        auth.notifier.showErrorSnackBar(
            'Please fill in both email and password', context);
        return;
      }

      await auth.notifier.signin(email, password);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Image.asset(
              themeProvider == ThemeMode.dark ? DARK_LOGO_IMG : LIGHT_LOGO_IMG,
              width: 150,
            ),
          ),
          // Showing error message if any
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   margin: const EdgeInsets.only(bottom: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.red.shade100,
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   child: Row(
          //     children: [
          //       const Icon(Icons.error_outline, color: Colors.red),
          //       const SizedBox(width: 8),
          //       Expanded(
          //         child: Text(
          //           loginState.errorMessage ?? 'Error',
          //           style: const TextStyle(color: Colors.red),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 50),
          LoginTextField(
              controller: widget.emailController!, labelText: "Email"),
          const SizedBox(height: 16),

          LoginTextField(
            controller: widget.passwordController!,
            labelText: "Password",
            obscureText: showPassword,
            suffixIcon: IconButton(
              icon: Icon(
                showPassword ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                ref.read(loginPasswordVisibilityProvider.notifier).state =
                    !showPassword;
              },
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      print("Forget Password Button");
                    },
                    child: Text(
                      "Forget Password ?",
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor),
                    )),
              ],
            ),
          ),
          SizedBox(height: 5),
          LoginScreenButtonGroupContainer(
            onPressedLogin: signinButton,
            onPressedRegister: () => context.router.push(RegisterRoute()),
          ),
        ],
      ),
    );
  }
}
