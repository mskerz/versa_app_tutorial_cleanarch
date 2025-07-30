import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_avatar.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/account_setting.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/contact_setting.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/other_setting.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class SettingOverViewScreen extends ConsumerWidget {
  const SettingOverViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = AuthProviderInstance(ref);
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final theme = Theme.of(context);
    final themeMode = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    double screenWidth = MediaQuery.of(context).size.width;

    void _handleBackButtonPress() {
      final previousIndex =
          ref.read(transitionProvider.notifier).getPreviousIndex();

      if (previousIndex != null) {
        // เปลี่ยนไปยังเมนูที่เคยเปิด
        ref.read(transitionProvider.notifier).transitionTo(previousIndex);
      } else {
        // หากไม่พบ previousIndex ให้รีเซ็ตกลับไปยังหน้าแรก
        ref.read(transitionProvider.notifier).resetToHome();
      }

      // ย้อนกลับหน้าปัจจุบัน
      context.router.back();
    }

    return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leadingWidth: screenWidth,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: UserAvatar(
                  userResponse: auth.user,
                )),
            IconButton(
                onPressed: () {
                  themeNotifier.toggleTheme();
                },
                icon: Icon(
                  themeMode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                ))
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.8),
          child: Container(
              height: 0.8,
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Divider(
                  height: 1,
                  color: Theme.of(context).primaryColor.withAlpha(25))),
        ),
      ),
      body: AppBodyWithGredient(
        removeFixedPadding: true,
        content: SafeArea(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: AccountSetting(
                  theme: theme,
                  loginState: auth.isLoggedIn,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // isLoggedIn
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              //         child: SecuritySetting(theme: theme),
              //       )
              //     : SizedBox.shrink(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ContactSetting(theme: theme),
              ),
              SizedBox(
                // หน้า setting screen  เสร็จ
                height: 8,
              ),
              isLoggedIn
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: OtherSettings(
                        theme: theme,
                        instance: auth,
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
