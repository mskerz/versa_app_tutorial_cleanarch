import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/widgets/components/notification_item_card.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';

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
      child: ListView(
        shrinkWrap: true,
        physics:
            AlwaysScrollableScrollPhysics(), // เพิ่ม physics เพื่อให้เลื่อนได้ตลอด
        padding: EdgeInsets
            .zero, // เพิ่ม padding เป็น zero เพื่อไม่ให้มี padding เริ่มต้น
        scrollDirection: Axis.vertical,
      
        children: widget.notifications.map((notification) {
          final index = widget.notifications.indexOf(notification);
      
          return NotificationItemCard(
            onMarkAsRead: widget.onMarkAsRead,
            onDelete: widget.onDelete,
            item: notification,
            index: index,
          );
        }).toList(),
      ),
    );
  }
}
