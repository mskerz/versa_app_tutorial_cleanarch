import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/menu_options.dart';

class SecuritySetting extends ConsumerWidget {
  final ThemeData theme;
  const SecuritySetting({super.key, required this.theme});

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
            "Security Setting",
            style: GoogleFonts.poppins(color: theme.primaryColor, fontSize: 14),
          )),
          MenuOption(
              label: "2 Factor  Authentication",
              icon: Icons.lock,
              theme: theme,
              onPressed: () {}),
          MenuOption(
              label: "Biometrics and PIN",
              icon: FontAwesomeIcons.fingerprint,
              theme: theme,
              onPressed: () {})
        ],
      ),
    );
  }
}
