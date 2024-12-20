import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_intro_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_list_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/screens/home_screen.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

part 'app_route.gr.dart'; // ไฟล์นี้จะถูกสร้างโดย build_runner

@AutoRouterConfig(replaceInRouteName: 'Screen,Route') 
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); 

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          initial: true, // หน้าแรก
          transitionsBuilder: _fadeTransition, // ใช้ Fade Transition
          durationInMilliseconds: 0, // ระยะเวลา Fade
        ),
        CustomRoute(
          page: TokenRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 0,
        ),
        CustomRoute(
          page: TokenIntroRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 0,
        ),
      ];

  // ฟังก์ชั่นสำหรับการเปลี่ยนหน้าแบบ Fade พร้อมสีพื้นหลัง
  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // ใช้ FadeTransition พร้อมการกำหนดสีพื้นหลัง
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // ใช้ ColorTween เพื่อเปลี่ยนสีพื้นหลังจากโปร่งใสเป็นสีที่ต้องการ
        
        return Container(
          color: Colors.transparent, // กำหนดสีพื้นหลัง
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: child,
    );
  }
}
