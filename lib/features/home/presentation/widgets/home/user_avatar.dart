import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets_app.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_response.dart';

class UserAvatar extends ConsumerWidget {
  final UserResponse? userResponse;
  final bool? isVisibleName;
  const UserAvatar({super.key, this.userResponse,this.isVisibleName= true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUser = userResponse != null;
    final isLoggedIn = isUser ? userResponse!.isloggedIn : false;
    final user = isUser ? userResponse!.user : null;

    Widget buildAvatar() {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: GradientBoxBorder(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2F5CFF),
                Color(0x8D8D1BBC),
              ],
            ),
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: isLoggedIn
              ? NetworkImage(user!.image)
              : AssetImage(DEFAULT_IMAGE_PROFILE) as ImageProvider,
        ),
      );
    }

    return Row(
      children: [
        buildAvatar(),
        SizedBox(width: 16),
     isVisibleName! ?   Text(
          isLoggedIn
              ? '${user!.firstName} ${user.lastName}'
              : 'Guest',
          style: GoogleFonts.poppins(
            fontSize: 16, // ปรับขนาดฟอนต์ให้เหมาะสม
            color: Theme.of(context).primaryColor,
          ),
        ):SizedBox.shrink(),
      ],
    );
  }
}
