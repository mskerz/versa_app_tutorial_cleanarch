import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets_app.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController.text = "johndoe@example.com";
    passwordController.text = "securePassword123";
  }

  // สร้างฟังก์ชันสำหรับแสดง error snackbar

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

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
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent,
                ),
              ),
            );
          },
        );

        // หน่วงเวลา 2 วินาที ก่อนที่จะทำการนำทาง
        Future.delayed(const Duration(seconds: 2), () {
          // ปิด Dialog เมื่อหน่วงเวลาหมด
          Navigator.of(context).pop();

          // ทำการนำทางไปยังหน้า Home
          context.router.replace(const HomeRoute());
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Image.asset(
                LIGHT_LOGO_IMG,
                width: 300,
              ),
            ),
            // แสดง error message ถ้ามี
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.black38, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.black38, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: obscurePassword,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(

                children: [
                  TextButton(onPressed: (){
                    print("Forget Password Button");
                  }, child: Text("Forget Password ?",style: GoogleFonts.prompt(color: Colors.black),))
                  ,
                  
                 ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  // ตรวจสอบว่า email หรือ password ว่าง
                  if (email.isEmpty || password.isEmpty) {
                    authNotifier.showErrorSnackBar(
                        'Please fill in both email and password', context);
                    return;
                  }

                  await authNotifier.signin(email, password);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                  disabledBackgroundColor: Colors.grey,
                ),
                icon: Icon(Icons.login),
                label: Text(
                  'Sign In',
                  style: GoogleFonts.prompt(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 5),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.black38,
                      thickness: 1, // ความหนาของเส้น
                    ),
                  ),
                  Text(
                    " or ",
                    style: GoogleFonts.prompt(
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.black38,
                      thickness: 1, // ความหนาของเส้น
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                
                child: ElevatedButton.icon(
                  onPressed: () {
                    AutoRouter.of(context)
              .pushAndPopUntil(RegisterRoute(), predicate: (_) => false);
                  },
                   
                  style: ElevatedButton.styleFrom(
                    
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF0D2B5B),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  label: Text("Sign Up",style: GoogleFonts.kanit(
                    
                  ),),
                  icon: Icon(Icons.create),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
