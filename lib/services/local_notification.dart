import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
 static FlutterLocalNotificationsPlugin _localNotificationsPlugin=FlutterLocalNotificationsPlugin();

 static Future _notificationDetails()async{
   return const NotificationDetails(
     android: AndroidNotificationDetails(
       "important_notification",
       "notification_order_app",
         icon: '@mipmap/ic_launcher',
       importance: Importance.max
     ),
     iOS: IOSNotificationDetails(),
   );
 }

 static Future showNotification({
int id=0,
String? title,
   String? body,

})async{
   await _localNotificationsPlugin.show(id, title, body,
       await _notificationDetails()
       );

 }

}