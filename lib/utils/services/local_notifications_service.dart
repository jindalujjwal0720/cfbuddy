import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotificationsService {
  void showNotification() {
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      "notification-cfbuddy",
      "CFBuddy Notifications",
      priority: Priority.max,
      importance: Importance.max,
    );
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    localNotificationsPlugin.show(
      1,
      "hi",
      "This is the content of first notification from plugin.",
      notificationDetails,
    );
  }

  Future<void> scheduleNotification(int id, String title, String body, DateTime time) async {
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      "notification-cfbuddy",
      "CFBuddy Notifications",
      priority: Priority.max,
      importance: Importance.max,
    );
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(time, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> removeAllLocalNotifications() async {
    await localNotificationsPlugin.cancelAll();
  }
}
