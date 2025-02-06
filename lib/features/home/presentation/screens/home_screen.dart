
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/home_container.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/notification_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification_badge.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   

    final notificationCount = ref.watch(notificationCountUnreadProvider);
    final appThemeNotifier = ref.read(appThemeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
     return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showDrawer: false,
      
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 150, // Set a fixed width for the leading widget
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return LeadingLogo(
        //       logoAssetPath:
        //           theme == ThemeMode.dark ? DARK_LOGO_IMG : LIGHT_LOGO_IMG,
        //       onMenuPressed: () {
        //         // Open the drawer using the correct context
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   },
        // ),
        actions: [
          NotificationBadge(
            notificationCount: notificationCount, // Example: 3 notifications
          ),
          IconButton(
              onPressed: () {
                appThemeNotifier.toggleTheme();
              },
              icon: Icon(
                theme == ThemeMode.dark
                    ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                    : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: AppBodyWithGredient(
        content: HomeContainer(),
      )
    );
  }
}
