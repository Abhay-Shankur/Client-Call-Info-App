// call_handler.dart

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CallHandler {
  static const MethodChannel _channel = MethodChannel('com.callinfo.application.call_info/callType');

  static String _callType = '';
  static bool _callIncoming = false;

  static void setupCallHandler(void Function(String) onCallTypeReceived) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'receiveCallType') {
        _callType = call.arguments;
        onCallTypeReceived(_callType);
        _showNotification(_callType); // Send notification
      }
    });
  }

  static void _showNotification(String callType) async {
    

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'com.example.call_detection',
      'Call Detection',
      channelDescription:'Notification channel for call detection',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Call Detected',
      'Call type: $callType',
      platformChannelSpecifics,
    );
  }

}
