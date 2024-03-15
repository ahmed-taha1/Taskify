// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
// import 'package:get/get.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import '../../data/models/task.dart';
// import '/ui/pages/notification_screen.dart';
//
// class NotifyHelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   String selectedNotificationPayload = '';
//
//   final BehaviorSubject<String> selectNotificationSubject =
//   BehaviorSubject<String>();
//
//   initializeNotification() async {
//     tz.initializeTimeZones();
//     _configureSelectNotificationSubject();
//     await _configureLocalTimeZone();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('appicon');
//
//     const InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: initializationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: (String? payload) async {
//         if (payload != null) {
//           debugPrint('notification payload: $payload');
//           selectNotificationSubject.add(payload);
//         } else {
//           debugPrint('notification payload is null');
//           // Handle the case when the payload is null
//         }
//       },
//     );
//   }
//
//   displayNotification({required String title, required String body}) async {
//     print('doing test');
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//         'your channel id', 'your channel name',
//         importance: Importance.max, priority: Priority.high);
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'Default_Sound',
//     );
//   }
//
//   scheduledNotification(int hour, int minutes, Task task) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       task.id!,
//       task.title,
//       task.note,
//       _nextInstanceOfTenAM(hour, minutes),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//             'your channel id', 'your channel name',
//             importance: Importance.max, priority: Priority.high),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//       payload: '${task.title}|${task.note}|${task.startTime}|',
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOfTenAM(int hour, int minutes) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate =
//     tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   void requestIOSPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   Future<void> _configureLocalTimeZone() async {
//     tz.initializeTimeZones();
//     final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//   }
//
//
//   void _configureSelectNotificationSubject() {
//     selectNotificationSubject.stream.listen((String payload) async {
//       debugPrint('My payload is ' + payload);
//       await Get.to(() => NotificationScreen(payload: '1|2|3',));
//     });
//   }
// }