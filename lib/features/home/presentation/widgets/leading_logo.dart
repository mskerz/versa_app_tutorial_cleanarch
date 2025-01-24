import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class LeadingLogo extends ConsumerWidget {
  final String logoAssetPath;
  final Function()? onMenuPressed;

  const LeadingLogo({
    Key? key,
    required this.logoAssetPath,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Row(
      mainAxisSize: MainAxisSize
          .min, // Prevent the row from taking up more space than needed
      children: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (onMenuPressed != null) {
              onMenuPressed!();
            }
          },
        ),
        SizedBox(width: 8),
        // Image is inside a ClipRect to prevent overflow
         Image.asset(
          logoAssetPath,
          height: theme == ThemeMode.dark ? 22:32,
          fit: BoxFit.contain,
        ) ,
      ],
    );
  }
}
