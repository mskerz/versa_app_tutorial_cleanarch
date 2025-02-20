import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';

class AvatarIcon extends StatelessWidget {
  final ThemeData theme;
  final IconData icon;

  const AvatarIcon({
    Key? key,
    required this.theme,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final gradient = theme.extension<GradientBackgroundExtention>()!;
      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:  gradient.gradientBlackgroundIcon),
                        child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              icon,
                              color:theme.primaryColor,
                              size: 12,
                            )));
  }
}


 