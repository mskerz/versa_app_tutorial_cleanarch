
import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/login/divider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/login/login_button.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/widgets/forms/login/register_button.dart';

class LoginScreenButtonGroupContainer extends StatelessWidget {
  final void Function() onPressedLogin;
  final void Function() onPressedRegister;
  const LoginScreenButtonGroupContainer({super.key,required this.onPressedLogin, required this.onPressedRegister});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SignInButton(onPressed: onPressedLogin),
          DividerRow(),
          SignUpButton(onPressed: onPressedRegister)
        ],
      ),
    );
  }
}