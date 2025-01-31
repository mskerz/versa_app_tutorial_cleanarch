import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';

class NotificationConfig {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidInitializationSettings androidInitSetting =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static const DarwinInitializationSettings iosInitSetting =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // ฟังก์ชันสำหรับสร้าง platformChannel
  static NotificationDetails _getPlatformChannel(int badgeNumber) {
    DarwinNotificationDetails iosNotificationDetail = DarwinNotificationDetails(
      badgeNumber: badgeNumber,
    );
    return NotificationDetails(iOS: iosNotificationDetail);
  }

  // ฟังก์ชันเริ่มต้นการตั้งค่าการแจ้งเตือน

  static Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: androidInitSetting,
        iOS: iosInitSetting,
      ),
      onDidReceiveNotificationResponse:
          onNotificationTap, // Handle notification taps
    );
    await resetBadge();
  }

  // ฟังก์ชันแสดงการแจ้งเตือนหลายรายการ
  static Future<void> showNotify(
      int badgeNumber, List<Notify> notifications) async {
    var platformChannel = _getPlatformChannel(badgeNumber);

    // สร้าง List ใหม่ที่เก็บการแจ้งเตือน
    List<Notify> notificationList = [];
  int notificationId = 0;
    // ถ้ามีการแจ้งเตือนใน notifications ที่รับเข้ามา
    if (notifications.isNotEmpty) {
      // ใช้การแจ้งเตือนทั้งหมดจาก notifications ที่รับมา
      for (var notification in notifications) {
        // เพิ่มการแจ้งเตือนใหม่ไปใน notificationList
        notificationList.add(notification);
 
        await flutterLocalNotificationsPlugin.show(
          notificationId++,
          notification.title,
          notification.content,
          platformChannel,
          payload: 'notification_route', // เพิ่ม payload สำหรับการนำทาง
        );
      }
    }
  }

  // ฟังก์ชันรีเซ็ต badge เป็น 0

  static Future<void> resetBadge() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      null,
      null,
      const NotificationDetails(
        iOS: DarwinNotificationDetails(badgeNumber: 0, presentSound: false),
      ),
    );
  }

  static void onNotificationTap(NotificationResponse response) {
    // Extract payload or other data from the notification
    final String? payload = response.payload;

    // Navigate to a specific screen based on the payload or notification ID
    if (payload != null) {
      print("go to notification route");
    }
  }
}
