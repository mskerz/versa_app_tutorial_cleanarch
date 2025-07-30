import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class LeadingLogo extends ConsumerWidget {
  final String logoAssetPath;

  const LeadingLogo({
    Key? key,
    required this.logoAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Padding(
      
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize
            .min, // Prevent the row from taking up more space than needed
        children: [
         
          // Image is inside a ClipRect to prevent overflow
           Image.asset(
            logoAssetPath,
            height:100,
            fit: BoxFit.contain,
            width: 100,
          ) ,
        ],
      ),
    );
  }
}
