import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ignore: non_constant_identifier_names
FlutterLocalNotificationsPlugin NotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void showNotifications() async {
  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    'Darryl',
    'Deepesh',
    priority: Priority.max,
    importance: Importance.max,
  );

  DarwinNotificationDetails iosdetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: iosdetails,
  );

  await NotificationsPlugin.show(0, 'Darryl', 'Deepesh', notificationDetails);
}
