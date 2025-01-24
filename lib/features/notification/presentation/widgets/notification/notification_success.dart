import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/notifier/token_list_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_list_state.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

class NotificationSuccess extends ConsumerStatefulWidget {
  final List<Notify> notifications;
  final Function(int) onMarkAsRead;
  final Function(String) onDelete;

  const NotificationSuccess({
    super.key,
    required this.notifications,
    required this.onMarkAsRead,
    required this.onDelete,
  });

  @override
  _NotificationSuccessState createState() => _NotificationSuccessState();
}

class _NotificationSuccessState extends ConsumerState<NotificationSuccess> {
  @override
  Widget build(BuildContext context) {
    final tokenNotifier = ref.watch(tokenNotifierProvider.notifier);
    return Expanded(
      child: ListView.builder(
        itemCount: widget.notifications.length,
        itemBuilder: (context, index) {
          final notification = widget.notifications[index];

          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: child,
              );
            },
            child: GestureDetector(
              onTap: () {
                widget.onMarkAsRead(index);
                tokenNotifier.RouteToken(notification.info.symbol,
                    (found, item) {
                  if (found) {
                    context.router.push(TokenIntroRoute(tokenItem: item));
                  } else {
                     showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          title: Text(
                            'แจ้งเตือน',
                            style: GoogleFonts.kanit(
                                color: Theme.of(context).primaryColor),
                          ),
                          content: Text(
                            'ไม่พบโทเคนที่ต้องการ',
                            style: GoogleFonts.kanit(
                                color: Theme.of(context).primaryColor),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // ปิด Dialog
                              },
                              child: Text(
                                'ปิด',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: notification.isRead
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: notification.isRead
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.red,
                    ),
                    child: Text(
                      notification.isRead ? "Read" : "New",
                      style: GoogleFonts.prompt(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    notification.title,
                    style: GoogleFonts.kanit(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  subtitle: Text(
                    notification.content,
                    style: GoogleFonts.prompt(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize
                        .min, // ลดขนาด Column ให้เล็กที่สุดที่จำเป็น
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.trashCan),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          widget.onDelete(notification.messageId);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
