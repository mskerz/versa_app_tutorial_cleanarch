import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/setting/setting_icon.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/app_scaffold.dart';

class SettingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final isLoggedIn = ref.watch(isLoggedInProvider);

    void _handleBackButtonPress() {
      final previousIndex =
          ref.read(transitionProvider.notifier).getPreviousIndex();

      if (previousIndex != null) {
        // เปลี่ยนไปยังเมนูที่เคยเปิด
        ref.read(transitionProvider.notifier).transitionTo(previousIndex);
      } else {
        // หากไม่พบ previousIndex ให้รีเซ็ตกลับไปยังหน้าแรก
        ref.read(transitionProvider.notifier).resetToHome();
      }

      // ย้อนกลับหน้าปัจจุบัน
      context.router.back();
    }

    return AppScaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "App Settings",
          style: GoogleFonts.kanit(color: Colors.white),
        ),
        leading:
            BackButton(color: Theme.of(context).colorScheme.secondary, onPressed: _handleBackButtonPress),
      ),
      body: ListView(
        children: [
          // Container ครอบข้อมูลของผู้ใช้
          SizedBox(
            height: 10,
          ),
          isLoggedIn
              ? Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: user!.image.isNotEmpty
                              ? NetworkImage(user.image)
                              : AssetImage(
                                  DEFAULT_IMAGE_PROFILE) // ตรวจสอบ image
                          ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.firstName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user.email,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),

          // List items
          isLoggedIn ? SettingIconTile(
            title: "Account Setting",
            icon: Icons.account_circle,
            onTap: () {},
          ):Container(),
          SettingIconTile(
            title: "Privacy & Security",

          
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          SettingIconTile(
            title: "About Us",
            icon: FontAwesomeIcons.circleQuestion,
            onTap: () {},
          ),
          !isLoggedIn ? 
          SettingIconTile(title: "Sign in", icon: Icons.login, onTap: (){}):
          SettingIconTile(
            title: "Sign out",
            icon: Icons.logout_outlined,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.prompt(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform logout action
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Sign out',
                          style: GoogleFonts.prompt(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
