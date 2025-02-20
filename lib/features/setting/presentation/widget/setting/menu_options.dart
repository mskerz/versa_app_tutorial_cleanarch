import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/setting_card.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/setting_icon.dart';

class MenuOption extends ConsumerWidget {
  final ThemeData theme;
  final void Function() onPressed;
  final String label;
  final IconData icon;
  const MenuOption(
      {super.key,required this.label,required this.icon ,required this.theme, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: SettingCard(
        theme: theme,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.transparent,
          child: ListTile(
            leading: AvatarIcon(
              icon: icon,
              theme: theme,
            ),
            title: Text(
              label,
              style:
                  GoogleFonts.poppins(color: theme.primaryColor, fontSize: 12),
            ),
            trailing:
                Icon(Icons.chevron_right, color: theme.primaryColor, size: 16),
          ),
        ),
      ),
    );
  }
}
