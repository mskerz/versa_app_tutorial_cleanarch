import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFFFFF); // สีขาว
  static const Color secondary = Color(0xFFFFB143); // สี FFB143
  static const Color lightBlue = Color.fromARGB(255, 71, 160, 255); // สีเทาอ่อน
  static const Color lightSkyBlue =
      Color.fromARGB(255, 95, 173, 255); // สีเทาอ่อน

  static const Color lightGrey = Color(0xFFBDBDBD); // สีเทาอ่อน
  static const Color lightWhiteGrey = Color.fromARGB(255, 235, 235, 235);
  static const Color greyBlue = Color.fromARGB(255, 60, 73, 95);
  static const Color error = Color(0xFFFF0000); // สีแดงสำหรับ error
  static const Color black = Color(0xFF000000);

  static const Color backgroundContainerDark =
      Color.fromARGB(255, 49, 120, 195);
  static const Color backgroundContainerLight =
      Color(0xFFBDBDBD); // สีพื้นหลัง��ทนสีขา��
  // สีพื้นหลังโทนสีน้ำเงินมืด
  static const Color backgroundDarkBlue = Color(0xFF0D2B5B); // น้ำเงินเข้ม
  static const Color backgroundNavyBlue = Color(0xFF0A1D35); // นาวีบลู
  static const Color backgroundBlueBlack = Color(0xFF0B172A); // น้ำเงินดำ

  // gredient colors
  // Gradient Colors

  static const Gradient gradientDarkBlue = LinearGradient(
    colors: [
      Color(0x002F5CFF),
      Color.fromARGB(255, 197, 38, 255), // สีฟ้าอ่อน
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const Gradient gradientVersaBlackground = RadialGradient(
    center: Alignment.topRight, // จุดเริ่มต้นของ gradient ที่มุมบนขวา
    radius: 1.0, // ขยายขอบเขตของ Gradient
    colors: [
      Color(0xFF2F5CFF), // สีของจุด gradient ที่ 1
      Color(0x978D1BBA), // สีของจุด gradient ที่ 2 (rgba(141, 27, 186, 0.97))
      Colors.black, // สีที่เหลือจะเป็นสีดำ

      
    ],
    stops: [0.1, 0.6, 2], // การควบคุมระยะของสี
  );

  static const Gradient gradientOrange = LinearGradient(
    colors: [
      primary,

      greyBlue, //
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  // gradient container banner
  static const Gradient gradientPrimary = RadialGradient(colors: [
    primary,
    secondary,
    greyBlue,
  ], radius: 3);

  static const Gradient gradientSecondary = RadialGradient(colors: [
    lightBlue,
    backgroundDarkBlue,
  ], radius: 3);
}
