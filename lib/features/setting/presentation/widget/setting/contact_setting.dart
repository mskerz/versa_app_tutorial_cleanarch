import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/menu_options.dart';

class ContactSetting extends ConsumerWidget {
  final ThemeData theme;
  const ContactSetting({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                        margin: EdgeInsets.symmetric(vertical:5,horizontal: 10),

              child: Text(
            "Contact&Support",
            style: GoogleFonts.poppins(color: theme.primaryColor, fontSize: 14),
          )),
          MenuOption(
              label: "Terms of Service",
              icon: FontAwesomeIcons.file,
              theme: theme,
              onPressed: () {}),
          MenuOption(
              label: "Privacy Policy",
              icon: Icons.shield,
              theme: theme,
              onPressed: () {}),
          MenuOption(label: "Contact Us", icon: Icons.phone, theme: theme, onPressed: (){})
        ],
      ),
    );
  }
}
