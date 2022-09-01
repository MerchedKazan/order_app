import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          "important_notification",
          "notification_order_app",
          icon: '@mipmap/ic_launcher',
          importance: Importance.max
      ),
      iOS: IOSNotificationDetails(
        presentBadge: true,
        presentAlert: true,
        presentSound: true,
      ),
    );
  }
static Future initialize()async{
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS);
  await _localNotificationsPlugin.initialize(initializationSettings);
}
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,

  }) async {

    await _localNotificationsPlugin.show(id, title, body,
        await _notificationDetails()
    );
  }
}