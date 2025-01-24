// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingScreen(),
      );
    },
     NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationScreen(),
      );
    },
     SubscriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SubscriptionScreen(),
      );
    },
    TokenWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TokenWalletScreen(),
      );
    },
    
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
          routeData: routeData, child: RegisterScreen());
    },
    TokenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TokenListScreen(),
      );
    },
    TokenIntroRoute.name: (routeData) {
      // ตรวจสอบว่า args มีค่าไหมก่อนใช้งาน
      final args = routeData.argsAs<TokenIntroArgs>(
          orElse: () => const TokenIntroArgs());

      final tokenItem = args.token;

      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TokenIntroScreen(tokenItem!),
      );
    }
  };
}

class TokenRoute extends PageRouteInfo<void> {
  const TokenRoute({List<PageRouteInfo>? children})
      : super(
          TokenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TokenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}
class SubscriptionRoute extends PageRouteInfo<void> {
  const SubscriptionRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class TokenWalletRoute extends PageRouteInfo<void> {
  const TokenWalletRoute({List<PageRouteInfo>? children})
      : super(
          TokenWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'TokenWalletRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class TokenIntroRoute extends PageRouteInfo<TokenIntroArgs> {
  TokenIntroRoute({
    required Token tokenItem, // รับ parameter ที่จำเป็น
    List<PageRouteInfo>? children,
  }) : super(
          TokenIntroRoute.name,
          args: TokenIntroArgs(token: tokenItem),
          initialChildren: children,
        );

  static const String name = 'TokenIntroRoute';
  static const PageInfo<TokenIntroArgs> page = PageInfo<TokenIntroArgs>(name);
}

// กำหนดคลาสสำหรับเก็บ Argument
class TokenIntroArgs {
  const TokenIntroArgs({this.token});

  final Token? token;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: ${token.toString()}}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
