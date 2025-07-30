
import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';

Widget imageVersaLogo(ThemeMode theme, {double width = 60, double height = 40}) {
  return Image.asset(
    theme == ThemeMode.dark ? DARK_LOGO_IMG : LIGHT_LOGO_IMG,
    width: width,
    height: height,
  );
}
