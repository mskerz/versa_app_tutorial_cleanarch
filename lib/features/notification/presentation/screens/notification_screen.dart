import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/notification_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ตัวอย่างข้อมูลการแจ้งเตือน

    // ดึงสถานะการอ่านจาก provider
    final notifyState = ref.watch(notificationStateProvider);
    final notificationNotifier = ref.read(notificationStateProvider.notifier);

    final appThemeNotifier = ref.read(appThemeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: GoogleFonts.kanit(
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
                ref.watch(appThemeProvider) == ThemeMode.dark
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
            initial: () => Center(child: Text('Waiting for notifications...')),
            loading: () => Center(child: CircularProgressIndicator()),
            success: (notifications) {
              return Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];

                    return GestureDetector(
                      onTap: () {
                        print("tab notification");
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: notification.isRead ?Theme.of(context).colorScheme.secondaryContainer  :
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(notification.title,
                              style: GoogleFonts.kanit(
                                  fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor)),
                          subtitle: Text(notification.content,
                              style: GoogleFonts.prompt(color: Theme.of(context).primaryColor)),
                          leading: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: notification.isRead
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Colors.red),
                            child: Text(
                              notification.isRead ? "Read" : "New",
                              style: GoogleFonts.prompt(color: Colors.white),
                            ),
                          ),
                          onTap: notification.isRead
                              ? () {
                              print("readed !");
                              }
                              : () {
                                  notificationNotifier.markAsRead(index);
                                },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            failure: (exception) =>
                Center(child: Text("พบข้อผิดพลาด: ${exception.identifier}")),
            empty: () =>
                Center(child: Text("No have notifications in this time")),
          )
          //  Expanded(
          //   child: ListView.builder(
          //     itemCount: notifyState.notifications.length,
          //     itemBuilder: (context, index) {
          //       final isRead = notifyState[index];
          //       return Container(
          //         margin:
          //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //         decoration: BoxDecoration(
          //           color: isRead
          //               ? Colors.white
          //               : const Color.fromARGB(255, 244, 244, 244),
          //           borderRadius: const BorderRadius.all(Radius.circular(20)),
          //         ),
          //         child: ListTile(
          //           contentPadding: const EdgeInsets.symmetric(
          //               vertical: 10, horizontal: 20),
          //           leading: Icon(
          //             FontAwesomeIcons.circleInfo,
          //             color: isRead ? Colors.blueGrey : Colors.red,
          //           ),
          //           title: Text(
          //             notifications[index],
          //             style: GoogleFonts.kanit(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //           onTap: () {
          //             notificationNotifier.markAsRead(index);

          //             print("Read State: $isRead");
          //           },
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
