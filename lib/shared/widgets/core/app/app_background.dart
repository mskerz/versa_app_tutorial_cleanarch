import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme_extension.dart';

class AppBodyWithGredient extends StatelessWidget {
  final Widget? content;
  const AppBodyWithGredient({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    final gradient = Theme.of(context).extension<GradientBackgroundExtention>();
    return Stack(children: [
      Positioned(
        top: -28,
        left: 219,
        child: Container(
          width: 190,
          height: 190,
          decoration: BoxDecoration(
            gradient: gradient?.gradientBackground,
            borderRadius: BorderRadius.circular(60),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 250, sigmaX: 250),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 130,
      ),
      Positioned(
        top: 612,
        left: -64,
        child: Container(
          width: 220,
          height: 190,
          decoration: BoxDecoration(
            gradient: gradient?.gradientBackground,
            borderRadius: BorderRadius.circular(60),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 250,
              sigmaY: 250,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      Container(
      
        padding:  EdgeInsets.only(top: 130),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .scaffoldBackgroundColor
              .withAlpha(10), // เพิ่มพื้นหลังให้ MainContainer
          borderRadius: BorderRadius.circular(16),
        ),
        child: content ?? const SizedBox(),
      ),
    ]);
  }
}
