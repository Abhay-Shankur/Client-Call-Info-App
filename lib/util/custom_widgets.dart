import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToast(
    {required BuildContext context,
    required ToastificationType type,
    required String title,
    required String desc}) {
  Color? primary;
  Color? background;
  Color? foreground;

  switch (type) {
    case ToastificationType.success:
      primary = Colors.green;
      background = Colors.green.shade50;
      foreground = Colors.black;
      break;

    case ToastificationType.warning:
      primary = Colors.amber;
      background = const Color.fromARGB(203, 230, 200, 133);
      foreground = Colors.deepPurple;
      break;

    case ToastificationType.info:
      primary = Colors.blueAccent;
      background = Colors.white;
      foreground = Colors.black;
      break;

    case ToastificationType.error:
      primary = Colors.red;
      background = const Color.fromARGB(255, 255, 110, 110);
      foreground = Colors.white;
      break;

    default:
      break;
  }

  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 5),
    title: title,
    // you can also use RichText widget for title and description parameters
    description: desc,
    alignment: Alignment.bottomLeft,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.check, color: Colors.black),
    primaryColor: primary,
    backgroundColor: background,
    foregroundColor: foreground,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
  );
}

// void showNotification(String title, String message) async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'com.callinfo.application.call_info',
//     'Call Infos',
//     'Notification channel for call infos',
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     title,
//     message,
//     platformChannelSpecifics,
//   );
// }

Map<String, dynamic> stringToMap(String str) {
  return jsonDecode(str);
}
// void showSnackBar({required BuildContext context, required String message}) {
//   ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: const Duration(seconds: 3), // Adjust the duration as needed
//       )
//   );
// }
// void showToast() {
//   String text = _model.textController.text;
//
//   Fluttertoast.showToast(
//     msg: text.isNotEmpty ? text : 'Text field is empty',
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.CENTER,
//     backgroundColor: Colors.black,
//     textColor: Colors.white,
//   );
// }