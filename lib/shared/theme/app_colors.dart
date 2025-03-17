import 'package:flutter/material.dart';

class AppColors {
  static invertColor(Color color) {
    return Color.fromARGB(color.a.toInt(), 255 - color.r.toInt(),
        255 - color.g.toInt(), 255 - color.b.toInt());
  }

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

  static const Color filledTextFleidColorDark = Color.fromARGB(200, 20, 19, 23);
  static const Color filledTextFleidColorLight =
      Color.fromARGB(55, 138, 138, 138);

  static const Color walletButtonColorDark = Color(0xFF202832);
  static final Color walletButtonColorLight =
      invertColor(walletButtonColorDark);

  // gredient colors
  // Gradient Colors
}

class GradientAppColors {
  static const Gradient gradientDarkBlue = LinearGradient(
    colors: [
      Color(0x002F5CFF),
      Color.fromARGB(255, 197, 38, 255), // สีฟ้าอ่อน
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const Gradient gradientVersaDarkBlackground = LinearGradient(
    colors: [
        Color(0xFF2F5CFF), // #2F5CFF
                Color.fromRGBO(141, 27, 186, 0.6)
    ],
  );

  static const Gradient gradientVersaLightBlackground = RadialGradient(
    colors: [
      Color.fromARGB(255, 255, 200, 0), // สีของจุด gradient ที่ 1
      Color.fromARGB(141, 126, 255,
          75), // สีของจุด gradient ที่ 2 (rgba(141, 27, 186, 0.97))
    ], //
  );

  static const Gradient gradientOrange = LinearGradient(
    colors: [
      AppColors.primary,

      AppColors.greyBlue, //
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  // gradient container banner
  static const Gradient gradientPrimary = RadialGradient(colors: [
    AppColors.primary,
    AppColors.secondary,
    AppColors.greyBlue,
  ], radius: 3);

  static const Gradient gradientSecondary = RadialGradient(colors: [
    AppColors.lightBlue,
    AppColors.backgroundDarkBlue,
  ], radius: 3);

  static const Gradient gradientBottomBarDark = LinearGradient(
    colors: [
      Color(0xFF181D36), // First color in gradient
      Color(0xFF070B1E), // Second color in gradient
    ],
  );

  static const Gradient gradientBottomBarLight = LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 255, 255), // First color in gradient
      Color.fromARGB(223, 214, 214, 214), // Second color in gradient
    ],
  );

  static const Gradient gradientSweepDark = SweepGradient(
    center: Alignment.center,
    startAngle: 60 * (3.1416 / 180), // เปลี่ยนมุมเริ่มต้นไปทางขวา 60 องศา
    endAngle: 3.1416 * 2 + (60 * (3.1416 / 180)), // จบที่มุม 360 องศา
    colors: [
      Color(0xFF6978FD),
      Color(0xFF96A7FE),
      Color(0xFFC3DDFF),
      Color(0xFF8DCCFD),
      Color(0xFF6978FD),
    ],
  );
  static const Gradient gradientSweepLight = SweepGradient(
    center: Alignment.center,
    startAngle: 60 * (3.1416 / 180), // เปลี่ยนมุมเริ่มต้นไปทางขวา 60 องศา
    endAngle: 3.1416 * 2 + (60 * (3.1416 / 180)), // จบที่มุม 360 องศา
    colors: [
      Color(0xFFFF3F61), // Coral
      Color(0xFFFF9E7F), // Light Coral
      Color(0xFFFFB7A6), // Light Peach
      Color(0xFFFFD1B3), // Very Light Peach
      Color(0xFFFF6F61), // Coral (same as the first color)
    ],
  );

  // floating button color
  static const Gradient floatingBorderButtonGradientDark = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF1340E2), Color(0xF7911EBE)]);

  static const Gradient floatingButtonGradientDark = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF2F5CFF), // Gradient color start
        Color(0xFF8D1BBC), // Gradient color end
      ]);

  // Floating button color for Light Theme
  static const Gradient floatingBorderButtonGradientLight = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFFFA726), Color(0xFFFFCC80)]); // โทนส้ม-เหลือง

  static const Gradient floatingButtonGradientLight = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFFE0B2), // สีเริ่มต้น (โทนอ่อน)
        Color(0xFFFF9800), // สีปลาย (โทนส้มเข้ม)
      ]);

// background icon for Dark theme
  static const Gradient circleBackgroundMenuIconDark = LinearGradient(
    colors: [
      Color.fromRGBO(19, 64, 226, 0.5), // สีแรก
      Color.fromRGBO(145, 30, 190, 0.485), // สีที่สอง
    ],
  );

// background icon for Light theme
  static const Gradient circleBackgroundMenuIconLight = LinearGradient(
    colors: [
      Color.fromRGBO(144, 168, 255, 0.5), // สีแรก - เป็นสีฟ้าอ่อน
      Color.fromRGBO(198, 144, 220, 0.485), // สีที่สอง - เป็นสีม่วงอ่อน
    ],
  );

//wallet gradient
  static Gradient walletContainerGradientDark = LinearGradient(
    begin: Alignment.topLeft, // ปรับทิศทางของ Gradient
    end: Alignment.bottomRight,
    colors: [
      AppColors.primary.withAlpha(100), // rgba(255, 255, 255, 0.4)
      AppColors.primary.withAlpha(0), // rgba(255, 255, 255, 0)
    ],
    stops: [0.4, 1], // จุดแบ่งสี
  );
  static Gradient walletContainerGradientLight = LinearGradient(
    begin: Alignment.topLeft, // ปรับทิศทางของ Gradient
    end: Alignment.bottomRight,
    colors: [
      const Color.fromARGB(255, 62, 174, 112)
          .withAlpha(75), // rgba(255, 255, 255, 0.4)
      const Color.fromARGB(255, 62, 174, 112)
          .withAlpha(0), // rgba(255, 255, 255, 0)
    ],
    stops: [0.4, 1], // จุดแบ่งสี
  );


    static Gradient walletContainerBorderGradientDark = RadialGradient(
            radius: 3,

                          colors: const [Color(0x00FFFFFF), Color(0x46FFFFFF)]
                        );
    static Gradient walletContainerBorderGradientLight = RadialGradient(
      radius: 3,
                          colors:  const  [Color(0x00000000), Color(0x46000000)]
                        );

}
