import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

class AuthGuard extends AutoRouteGuard {
   final WidgetRef ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
 
   final isLoggedIn = ref.watch(isLoggedInProvider);

    // ถ้าผู้ใช้ไม่ได้ login และไม่ได้อยู่ในหน้า Login แล้วให้เปลี่ยนเส้นทางไปหน้า Login
    if (isLoggedIn) {
               router.replace(HomeRoute());

    } else {
      // ถ้าผู้ใช้ login แล้ว ให้ดำเนินการไปหน้าถัดไป
      resolver.next(true);
    }
  }
}
