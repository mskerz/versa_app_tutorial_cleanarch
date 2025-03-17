import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';

class AppBodyWithGredient extends StatelessWidget {
  final Widget? content;
  final bool? removeFixedPadding;
  const AppBodyWithGredient({super.key, this.content, this.removeFixedPadding = false});

  @override
  Widget build(BuildContext context) {
    final gradient = Theme.of(context).extension<GradientBackgroundExtention>();
    
    return Stack(
      // ตั้งค่า fit เป็น StackFit.expand เพื่อให้ Stack ขยายเต็มพื้นที่
      fit: StackFit.expand,
      children: [
        // ส่วนของพื้นหลัง Gradient แสดงเป็นชั้นล่างสุด (index 0)
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
                  color: Colors.black.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        
        // Gradient ด้านล่าง (index 1)
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
        
        // ตัด SizedBox ที่ไม่จำเป็นออก เพราะไม่มีผลต่อการแสดงผลใน Stack
        
        // Content จะถูกวางเป็นชั้นบนสุด (index 2)
        // ใช้ Positioned.fill เพื่อให้ Container ขยายเต็มพื้นที่ของ Stack
        Container(
          // ไม่ต้องกำหนด height เพราะใช้ Positioned.fill
          padding: removeFixedPadding! 
              ? EdgeInsets.only(top: 0) 
              : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          decoration: BoxDecoration(
            // ให้มั่นใจว่า background เป็น transparent
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: content ?? const SizedBox(),
        ),
      ],
    );
  }
}