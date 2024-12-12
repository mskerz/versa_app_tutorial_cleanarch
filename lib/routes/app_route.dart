import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_list_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/screens/home_screen.dart';

part 'app_route.gr.dart'; // จะสร้างไฟล์นี้โดยอัตโนมัติเมื่อรัน build_runner

@AutoRouterConfig(replaceInRouteName: 'Screen,Route') // ใช้สำหรับเปลี่ยนชื่อของเส้นทาง
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); // ใช้การนำทางแบบ Material

  @override
  List<AutoRoute> get routes => [
    // ใช้ CustomRoute เพื่อกำหนดการเปลี่ยนหน้าเป็น fade
    CustomRoute(
      page: HomeRoute.page,
      initial: true, // หน้าแรก
      transitionsBuilder: _fadeTransition, // ฟังก์ชั่นสำหรับ fade transition
      durationInMilliseconds: 200, // ระยะเวลา transition
    ),
    CustomRoute(
      page: TokenRoute.page,
      transitionsBuilder: _fadeTransition,
      durationInMilliseconds: 200,
    ),
  ];

  // ฟังก์ชั่นสำหรับการเปลี่ยนหน้าแบบ Fade
  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // ใช้ FadeTransition
    return FadeTransition(opacity: animation, child: child);
  }
}
