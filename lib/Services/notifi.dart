import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('app');

  DarwinInitializationSettings iossettings = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );

  // ignore: non_constant_identifier_names
  void InitialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iossettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotifications(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Darryl', 'Deepesh',
            importance: Importance.max, priority: Priority.max);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}
