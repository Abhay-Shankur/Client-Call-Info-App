// call_handler.dart

import 'package:call_info/handlers/sms_handler.dart';
import 'package:call_info/handlers/wp_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CallHandler {
  static const MethodChannel _channel = MethodChannel('com.callinfo.application.call_info/callType');
  static const MethodChannel _permission = MethodChannel('com.callinfo.application.call_info/permission');

  static String _phoneNumber = '';
  static String _callType = '';
  static bool _smsAllowed = false;

  static void setupCallHandler() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'receiveCallType') {
        _callType = call.arguments['callType'];
        _phoneNumber = call.arguments['phoneNumber'];

        // onCallTypeReceived(_callType);
        // _smsAllowed = await SharedPreferencesHelper.getBool('allowSMS') ?? false;
        // debugPrint('Permission: $_smsAllowed');
        if(_callType == 'Ongoing') {
          // _showNotification("Sending Incoming Message"); // Send notification

          await WhatsappHandler.sendWP(phone: _phoneNumber.replaceAll("+", '')) ? _showNotification("WhatsApp Sent Successfully") : null ;
          await SmsHandler.sendMessage(_phoneNumber) ? _showNotification("SMS Sent Successfully") : null ;
        } else if(_callType == 'Missed') {
          // _showNotification("Sending Missed Message"); // Send notification
          await WhatsappHandler.sendWP(phone: _phoneNumber.replaceAll("+", '')) ? _showNotification("WhatsApp Sent Successfully") : null ;
          await SmsHandler.sendMessage(_phoneNumber) ? _showNotification("SMS Sent Successfully") : null ;
        } else if(_callType == 'Incoming') {
          // _showNotification(_callType); // Send notification
        } else {
          // _showNotification(_callType); // Send notification
        }
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
