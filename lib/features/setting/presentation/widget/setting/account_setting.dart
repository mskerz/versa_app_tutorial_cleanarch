import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/menu_options.dart';

class AccountSetting extends ConsumerWidget {
  final ThemeData theme;
  final bool loginState;

  AccountSetting({required this.theme,required this.loginState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
                        margin: EdgeInsets.symmetric(vertical:5,horizontal: 10),
            child: Text(
              "General Setting",
              style:
                  GoogleFonts.poppins(color: theme.primaryColor, fontSize: 14),
            ),
          ),
         loginState? MenuOption(
           label: "Account & Security Setting", // รวมทั้งสองตัวเลือก
              icon: Icons.account_circle,
              theme: theme,
              onPressed: () {}): SizedBox.shrink(),
          
           MenuOption(
              label: "Setting",
              icon: Icons.settings,
              theme: theme,
              onPressed: () {}),
        ],
      ),
    );
  }
}
