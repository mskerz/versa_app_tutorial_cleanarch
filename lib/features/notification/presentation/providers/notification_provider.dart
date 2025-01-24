// 4. สร้าง Provider สำหรับ StateNotifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/domain/providers/notify_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/state/notifier/notification_notifier.dart';

import 'state/notification_state.dart';

 

// 6. Providers
final notificationStateProvider = StateNotifierProvider<NotificationStateNotifier, NotificationState>((ref) {
  final repository = ref.watch(notifyRepositoryProvider);
  return NotificationStateNotifier(repository);
});


// Notification Provider
// provider สำหรับดึงจำนวนการแจ้งเตือน
final notificationCountUnreadProvider = Provider<int>((ref) {
  final notificationState = ref.watch(notificationStateProvider);

  return notificationState.maybeWhen(
    success: (notifications) {
      // กรองเฉพาะการแจ้งเตือนที่ isRead == false
      final unreadNotifications = notifications.where((notification) => !notification.isRead).toList();
      return unreadNotifications.length; // ส่งจำนวนการแจ้งเตือนที่ยังไม่ได้อ่าน
    },
    orElse: () => 0, // ถ้ายังไม่ได้ข้อมูลหรือเกิดข้อผิดพลาด ให้ส่งค่าผลลัพธ์เป็น 0
  );
});


final notificationCheckIsReadProvider = Provider.family<bool, int>((ref, index) {
  final notificationState = ref.watch(notificationStateProvider);

  return notificationState.maybeWhen(
    success: (notifications) {
      if (index >= 0 && index < notifications.length) {
        return notifications[index].isRead; // เช็คว่าเป็นการแจ้งเตือนที่อ่านแล้วหรือยัง
      }
      return false; // หากไม่มีการแจ้งเตือนในรายการให้คืนค่าเป็น false
    },
    orElse: () => false, // หากไม่ได้ข้อมูล หรือเกิดข้อผิดพลาด
  );
});
