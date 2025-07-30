import 'package:auto_route/auto_route.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthProviderInstance? auth;

  AuthGuard(this.auth);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // ถ้าล็อกอินแล้วให้ไปหน้าที่ต้องการได้เลย
    if (auth!.isLoggedIn) {
      resolver.next(true);
    } else {
      // หน่วงการเรียกใช้งาน redirect ไปจนกว่า navigator จะปลดล็อก
      await Future.delayed(Duration.zero);
      resolver.redirect(BlankPageRoute(
          onRedirect: (){
            
            router.replace(LoginRoute());
          }
             ));
    }
  }
}
