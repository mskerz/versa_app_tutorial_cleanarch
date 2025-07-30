import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/wallet/token_wallet_container.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_avatar.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/notification_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification_badge.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class TokenWalletScreen extends ConsumerStatefulWidget {
  const TokenWalletScreen({super.key});

  @override
  _TokenWalletScreenState createState() => _TokenWalletScreenState();
}

class _TokenWalletScreenState extends ConsumerState<TokenWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProviderInstance(ref);
    final themeNotifier = UIInstanceProvider(ref).themeNotifier;
    final theme = UIInstanceProvider(ref).themeMode;
    final notificationCount = ref.watch(notificationCountUnreadProvider);
    double screenWidth = MediaQuery.of(context).size.width;

    return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: screenWidth,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: UserAvatar(
                userResponse: auth.user,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  NotificationBadge(notificationCount: notificationCount),
                  IconButton(onPressed: (){
                    themeNotifier.toggleTheme();
                  },  icon: Icon(
                theme== ThemeMode.dark
                    ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                    : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ))
                ],
              ),
            ),
          ],
        ),
      ),
      body: AppBodyWithGredient(
        content: TokenWalletContainer(),
      ),
    );
  }

 
}
