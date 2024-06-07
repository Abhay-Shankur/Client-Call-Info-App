// call_handler.dart

import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/util/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CallHandler {
  static const MethodChannel _channel = MethodChannel('com.callinfo.application.call_info/callType');

  static String _phoneNumber = '';
  static String _callType = '';

  static void setupCallHandler() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'receiveCallType') {
        _callType = call.arguments['callType'];
        _phoneNumber = call.arguments['phoneNumber'];

        // onCallTypeReceived(_callType);
        // _smsAllowed = await SharedPreferencesHelper.getBool('allowSMS') ?? false;
        // debugPrint('Permission: $_smsAllowed');
        if(_callType == 'Ongoing' && await checkService()) {
          // await checkService();
          // _showNotification("Sending Incoming Message"); // Send notification

          // await WhatsappHandler.sendWP(phone: _phoneNumber.replaceAll("+", '')) ? _showNotification("WhatsApp Sent Successfully") : null ;
          // await SmsHandler.sendMessage(_phoneNumber) ? _showNotification("SMS Sent Successfully") : null ;
        } else if(_callType == 'Missed'  && await checkService()) {
          // await checkService();
          // _showNotification("Sending Missed Message"); // Send notification

          // await WhatsappHandler.sendWP(phone: _phoneNumber.replaceAll("+", '')) ? _showNotification("WhatsApp Sent Successfully") : null ;
          // await SmsHandler.sendMessage(_phoneNumber) ? _showNotification("SMS Sent Successfully") : null ;
        } else if(_callType == 'Incoming'  && await checkService()) {
          // await checkService();
          // _showNotification(_callType); // Send notification
        } else {
          // _showNotification(_callType); // Send notification
          _showNotification("",title: "Subscription",desc: "No Active Subscription"); // Send notification
        }
      }
    });
  }

  static Future<bool> checkService() async {
    try {
      await SharedPreferencesHelper.reload();
      // String start = await SharedPreferencesHelper.getString("start");
      String end = await SharedPreferencesHelper.getString("end");
      if(end.isNotEmpty) {
        int diff = MyDateUtils.getDifferenceInDays(DateTime.now(), MyDateUtils.parseDate(end));
        debugPrint("Difference: $diff");
        return diff>-1 ? true : false;
      } else {
        debugPrint("No Active Subscription");
        return false;
      }
    } catch (e) {
      debugPrint("Exception in CallHandler: $e");
      return false;
    }
  }

  static void _showNotification(String callType, {String title='Call Detected', String desc='Call type:'}) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'com.callinfo.application.call_info',
      'Call Infos',
      channelDescription:'Notification channel for call detection',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      callType.isNotEmpty ? '$desc $callType' : '$desc',
      platformChannelSpecifics,
    );
  }

}
