import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';

class NotifyResponse {
  List<Notify> notifications; // เปลี่ยนเป็น non-const list

  NotifyResponse({List<Notify>? notifications}):notifications = notifications ?? []; // ใช้ named parameter

  // สร้างจาก JSON
  factory NotifyResponse.fromJson(dynamic json) {
    // map json ไปเป็น List<Notify>
    final newNotification = Notify.fromJson(json) ;

    return NotifyResponse(
      notifications: [newNotification]
    );
  }

  void addNotification(Notify new_notify) {
    notifications.add(new_notify); // เพิ่มรายการใหม่ได้
  }
}
