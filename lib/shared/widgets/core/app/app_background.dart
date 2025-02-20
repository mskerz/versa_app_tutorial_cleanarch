import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';

class AppBodyWithGredient extends StatelessWidget {
  final Widget? content;
  final bool? removeFixedPadding;
  const AppBodyWithGredient({super.key, this.content,this.removeFixedPadding=false});

  @override
  Widget build(BuildContext context) {
    final gradient = Theme.of(context).extension<GradientBackgroundExtention>();
    return Stack(
      children: [
        // Positioned อยู่ด้านหลัง content
        Positioned(
          top: -28,
          left: 177,
          child: Container(
            width: 232,
            height: 234,
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
        // เพิ่ม `SizedBox` สำหรับพื้นที่ว่าง
        SizedBox(
          height: 130,
        ),
        Positioned(
          top: 612,
          left: -64,
          child: Container(
            width: 190,
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
        // content อยู่ด้านบนสุด
        Container(
          height:   MediaQuery.of(context).size.height,
          padding: removeFixedPadding! ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor
                .withAlpha(100), 
            borderRadius: BorderRadius.circular(16),
          ),
          child: content ?? const SizedBox(),
        ),
      ],
    );
  }
}
