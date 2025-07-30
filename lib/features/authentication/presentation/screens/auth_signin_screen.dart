import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/form_login.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    emailController.text = "johndoe@example.com";
    passwordController.text = "securePassword123";

    // emailController.text = "testuser@example.com";

    // passwordController.text = "TestPassword123";
  }

  // สร้างฟังก์ชันสำหรับแสดง error snackbar

  @override
  Widget build(BuildContext context) {
    final auth = AuthProviderInstance(ref);
    final themeNotifier = ref.read(appThemeProvider.notifier);

     final themeProvider = ref.read(appThemeProvider);


    // ฟังการเปลี่ยนแปลงสถานะของ loginNotifierProvider
  
    return AppScaffold(
      isVisibleBottomBar: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            context.router.back();
          },
        ),
        backgroundColor: Colors.transparent,
        actions: [
           IconButton(
                onPressed: () {
                  themeNotifier.toggleTheme();
                },
                icon: Icon(
                  themeProvider == ThemeMode.dark
                      ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                      : Icons.light_mode,
                  color: themeProvider == ThemeMode.dark ? Colors.white:Colors.black,
                ))
        ],
      ),
      body: AppBodyWithGredient(
        content: SignInForm(
          emailController: emailController,
          passwordController: passwordController,
          instance:auth ,
        )
     
     
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
