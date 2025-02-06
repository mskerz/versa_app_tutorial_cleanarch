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

  static const Gradient gradientVersaDarkBlackground = RadialGradient(
    colors: [
      Color(0xFF2F5CFF),
      Color(0xF78D1BBA),
    ],
  );

  static const Gradient gradientVersaLightBlackground = RadialGradient(
    colors: [
      Color.fromARGB(255, 255, 200, 0), // สีของจุด gradient ที่ 1
      Color.fromARGB(141, 126, 255, 75), // สีของจุด gradient ที่ 2 (rgba(141, 27, 186, 0.97))
    ], //
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


  static const Gradient gradientBottomBarDark = LinearGradient(

          colors: [
            Color(0xFF181D36),  // First color in gradient
            Color(0xFF070B1E),  // Second color in gradient
          ],
        );

         static const Gradient gradientBottomBarLight= LinearGradient(
 
          colors: [
            Color.fromARGB(255, 255, 142, 142),  // First color in gradient
            Color.fromARGB(255, 149, 255, 10),  // Second color in gradient
          ],
        );
}
