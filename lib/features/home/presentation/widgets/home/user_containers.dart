import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_avatar.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_skeleton.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

class UserContainerState extends ConsumerWidget {
  final AuthProviderInstance? instance;

  const UserContainerState({super.key, this.instance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        instance!.authState.when(
          initial: () => _buildNotLoggedInContainer(context),
          loading: () => shimmerLabelLoading(context),
          success: (userResponse) => userResponse != null 
              ? UserAvatar(userResponse: userResponse,)
              : const SizedBox.shrink(),
          failure: (_) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildNotLoggedInContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: GradientBoxBorder(gradient: RadialGradient(colors: [const Color.fromARGB(82, 158, 158, 158),const Color.fromARGB(124, 255, 255, 255)]) ),
        color: Theme.of(context).primaryColor.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You are not logged in ",
            style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
            ),
          ),
          TextButton(
            onPressed: () {
              context.router.push(LoginRoute());
            },
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

 


 
}