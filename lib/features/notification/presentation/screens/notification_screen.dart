import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/notification_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification/notification_empty.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification/notification_failure.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification/notification_initial.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/notification/notification_success.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';

@RoutePage()
class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // ตัวอย่างข้อมูลการแจ้งเตือน

    // ดึงสถานะการอ่านจาก provider
    final notifyState = ref.watch(notificationStateProvider);
    final notificationNotifier = ref.read(notificationStateProvider.notifier);

    final appThemeNotifier = ref.read(appThemeProvider.notifier);
    final appTheme = ref.watch(appThemeProvider);

    return AppScaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "การแจ้งเตือน",
          style: GoogleFonts.prompt(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: BackButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            context.router.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                appThemeNotifier.toggleTheme();
                print("Changed! theme");
              },
              icon: Icon(
                appTheme == ThemeMode.dark
                    ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                    : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.checklist,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  notificationNotifier.markAllAsRead();
                },
                label: Text(
                  "Mark all as Read",
                  style: GoogleFonts.kanit(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          notifyState.when(
            initial: () => NotificationInitial(),
            loading: () => Center(child: CircularProgressIndicator()),
            success: (notifications) => NotificationSuccess(
              notifications: notifications,
              onMarkAsRead: (index) {
                notificationNotifier.markAsRead(index);
              },
              onDelete: (messageId) {
                notificationNotifier.tryRemove(messageId);
              },
            ),
            failure: (exception) => NotificationFailure(
              message: exception.message,
              identifier: exception.identifier,
            ),
            empty: () => NotificationEmpty(),
          )
          
        ],
      ),
    );
  }
}
