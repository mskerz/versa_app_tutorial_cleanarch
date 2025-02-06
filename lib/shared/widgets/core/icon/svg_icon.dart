import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGIcons {
  static const String _basePath = 'assets/svg';

  // เพิ่มพารามิเตอร์ `color` เพื่อให้สามารถเลือกสีได้
  static Widget coin(Color color) {
    return SvgPicture.asset(
      '$_basePath/coin/coins.svg',
      width: 24.0,
      height: 24.0,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn), // ใช้สีที่ส่งเข้ามา
    );
  }
  static Widget  coin_outlined(Color color){
    return SvgPicture.asset(
        '$_basePath/coin/coin_outlined.svg',
        width: 24.0,
        height: 24.0,
        
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn), // ใช้สีที่ส่งเข้ามา

     );
  }
  static Widget get home => SvgPicture.asset(
        '$_basePath/home/home_filled.svg',
        width: 24.0,
        height: 24.0,
      );
  static Widget get home_outlined => SvgPicture.asset(
        '$_basePath/home/home_outlined.svg',
        width: 24.0,
        height: 24.0,
        colorFilter: ColorFilter.mode(
            Color(0x66FFFFFF), BlendMode.srcIn), // เพิ่ม colorFilter
      );
}
