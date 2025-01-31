import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/configs/notifications_platform_configs.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/domain/repository/notify_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/sort.dart';

import '../notification_state.dart';

// 1. สร้าง StateNotifier สำหรับจัดการสถานะการอ่านการแจ้งเตือน
// 2. Refactor StateNotifier to manage NotificationState
class NotificationStateNotifier extends StateNotifier<NotificationState> {
  final NotifyRepository repository;

  NotificationStateNotifier(this.repository)
      : super(const NotificationState.initial()) {
    // เรียก getNotify() เมื่อ StateNotifier ถูกสร้าง
    _listenToNotifications();
  }
  // 3. Fetch notifications and update state
  // Future<void> getNotify() async {
  //   state = const NotificationState.loading();
  //   final eitherResponse = await repository.getNotications();

  //   eitherResponse.fold(
  //     (exception) {
  //       state = NotificationState.failure(exception);
  //     },
  //     (response) {
  //       // Assuming response contains the totalCount and data, which we can use
  //       state = response.totalCount == 0
  //           ? const NotificationState.empty() // ใช้ empty หากไม่พบข้อมูล
  //           : NotificationState.success(response.notifications);
  //     },
  //   );
  // }

  void _listenToNotifications() {
    state = const NotificationState.empty();

    // ใช้ stream จาก notifyRepository
    final stream = repository.getNotify();
    stream.listen(
      (result) {
        result.fold(
          (exception) {
            state = NotificationState.failure(exception);
          },
          (data) {
            print("From State: ${data.notifications}");
            state = state.maybeWhen(
              success: (notifications) {
                final sortedNotifications = Sort().sort_byASC(
                  [...notifications, ...data.notifications],
                  (notification) => notification.isRead,
                );

                return NotificationState.success(sortedNotifications);
              },
              orElse: () {
                return NotificationState.success(data.notifications);
              },
            );
            // ย้ายการแสดงการแจ้งเตือนมาไว้จุดเดียว
            final currentNotifications = state.maybeMap(
              success: (value) => value.notifications,
              orElse: () => <Notify>[],
            );
            NotificationConfig.showNotify(
                currentNotifications.length, currentNotifications);
          },
        );
      },
      onError: (exception) {
        // จัดการข้อผิดพลาดจาก stream
        print("Error: ${exception.toString()}");
        state = NotificationState.failure(exception);
      },
    );
    print(state);
  }

  // 4. Mark a single notification as read
  void markAsRead(int index) {
    // เช็คว่า state เป็น success และมี notifications หรือไม่
    final notifications = state.maybeMap(
      success: (value) => value.notifications,
      orElse: () =>
          <Notify>[], // กำหนดให้เป็น List<Notify> เปล่าในกรณีที่ state ไม่ใช่ success
    );

    // ตรวจสอบว่า index ที่ได้รับมีอยู่ใน list หรือไม่
    if (index >= 0 && index < notifications.length) {
      // อัพเดตรายการที่เลือกให้ `isRead` เป็น `true`
      final updatedNotifications = [
        for (var i = 0; i < notifications.length; i++)
          if (i == index)
            notifications[i]
                .copyWith(isRead: true) // ใช้ copyWith เพื่อสร้าง instance ใหม่
          else
            notifications[i],
      ];
// อัพเดต state เป็น NotificationState.success พร้อม list ใหม่
      // ที่นี้เราจะจัดลำดับใหม่ให้ `isRead = false` มาก่อน
      final sortedNotifications = [
        ...updatedNotifications.where((notification) => !notification.isRead),
        ...updatedNotifications.where((notification) => notification.isRead),
      ];
      // อัพเดต state เป็น NotificationState.success พร้อม list ใหม่
      state = NotificationState.success(sortedNotifications);
    }
  }

  void markAllAsRead() {
    // เข้าถึงรายการ notifications ปัจจุบัน

    final notifications = state.maybeMap(
      success: (value) => value.notifications,
      orElse: () => <Notify>[],
    );
    if (notifications.isEmpty) {
      state = NotificationState.empty();
    } else {
      final updatedNotifications = [
        for (final notification in notifications)
          notification.copyWith(isRead: true),
      ];

      // อัปเดต state ให้กับ StateNotifier
      state = NotificationState.success(updatedNotifications);
    }

    // อัปเดตรายการ notifications ทั้งหมดให้ isRead = true
  }

  void tryRemove(String id) {
    final notifications = state.maybeMap(
      success: (value) => value.notifications,
      orElse: () => <Notify>[],
    );

    // ใช้ `where` เพื่อกรองรายการที่ messageId ไม่ตรงกับ id ที่ส่งเข้ามา
    // ignore: unrelated_type_equality_checks
    final updateNotifications = notifications
        .where((notification) => notification.messageId != id)
        .toList();

    if (updateNotifications.isEmpty) {
      state = NotificationState.empty();
    } else {
      state = NotificationState.success(updateNotifications);
    }

    // อัปเดต state ใหม่ด้วยรายการที่กรองแล้ว
  }
}
