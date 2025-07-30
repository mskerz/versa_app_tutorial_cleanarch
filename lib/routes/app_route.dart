import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/screens/auth_signin_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/screens/auth_signup_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_intro_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_list_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/screens/token_wallet_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/subscription/presentation/screens/subscription_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/screens/home_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/screens/notification_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/onboard/presentation/screen/onboad_screen.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/screen/setting_overview_screen.dart';
import 'package:versa_app_tutorial_cleanarch/routes/guards/auth_guard.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/screen/blank_screen.dart';

part 'app_route.gr.dart'; // ไฟล์นี้จะถูกสร้างโดย build_runner

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  final AuthProviderInstance  auth;

  AppRouter(this.auth);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
          page: OnboardRoute.page,
          initial: true,
          transitionsBuilder: _fadeTransition, // ใช้ Fade Transition
          durationInMilliseconds: 300, // ระยะเวลา Fade
        ),

         CustomRoute(
          page: BlankPageRoute.page,
          transitionsBuilder: _fadeTransition, // ใช้ Fade Transition
          durationInMilliseconds: 300, // ระยะเวลา Fade
        ),
        CustomRoute(
          page: HomeRoute.page,

          transitionsBuilder: _fadeTransition, // ใช้ Fade Transition
          durationInMilliseconds: 300, // ระยะเวลา Fade
        ),
        CustomRoute(
            page: LoginRoute.page,
            transitionsBuilder: _fadeTransition,
            durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: TokenRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: TokenIntroRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 100,
        ),
        CustomRoute(
          page: SettingRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 100,
        ),
        CustomRoute(
          page: NotificationRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: SubscriptionRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 300,
          guards:[ AuthGuard(auth)]
        ),
        CustomRoute(
          page: TokenWalletRoute.page,
          transitionsBuilder: _fadeTransition,
          durationInMilliseconds: 300,
            guards: [AuthGuard(auth)]),
        
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
