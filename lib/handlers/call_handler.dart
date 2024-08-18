// call_handler.dart

import 'dart:async';
import 'dart:typed_data';

import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/handlers/sms_handler.dart';
import 'package:call_info/handlers/wp_handler.dart';
import 'package:call_info/providers/repeat/repeat_numbers_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:call_info/util/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class CallHandler {
  static const MethodChannel _channel =
      MethodChannel('com.callinfo.application.call_info/callType');

  static String? _callType;

  static String? _phoneNumber;

  static void setupCallHandler() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'receiveCallType') {
        _callType = call.arguments['callType'];
        _phoneNumber = call.arguments['phoneNumber'];
        debugPrint("Phone Number : $_phoneNumber");

        bool isBlocked = await checkBlocklist();
        bool isServiceAvailable = await checkService();
        bool isRepeatOver = await checkNumberRepeat();
        debugPrint(
            " isBlocked : $isBlocked \n isServiceAvailable : $isServiceAvailable \n isRepeatOver : $isRepeatOver");

        if (isBlocked) {
          debugPrint("Phone Number $_phoneNumber is blocked.");
        }
        // else if(!(await checkService())){
        //   // _showNotification(_callType); // Send notification
        //   _showNotification("",title: "Subscription",desc: "Service Error."); // Send notification
        // }
        else if (_callType == 'Outgoing' &&
            isServiceAvailable &&
            isRepeatOver) {
          // _showNotification("Executing on call type: Ongoing");
          debugPrint("Executing on call type: Outgoing");
          // if(await WhatsappHandler.sendWP(phone: _phoneNumber!.replaceAll("+", ''))){
          //   _showNotification("WhatsApp Sent Successfully");
          //   setNumberRepeat();
          // }
          //
          // if(await SmsHandler.sendMessage(_phoneNumber!)) {
          //   _showNotification("SMS Sent Successfully");
          //   setNumberRepeat();
          // }
        } else if (_callType == 'Missed' &&
            isServiceAvailable &&
            isRepeatOver) {
          // _showNotification("Executing on call type: Missed");
          if (await WhatsappHandler.sendWP(
              phone: _phoneNumber!.replaceAll("+", ''))) {
            // _showNotification("WhatsApp Sent Successfully");
            debugPrint("Executing on call type: Missed");
            setNumberRepeat();
          }

          if (await SmsHandler.sendMessage(_phoneNumber!)) {
            // _showNotification("SMS Sent Successfully");
            debugPrint("Executing on call type: Missed");
            setNumberRepeat();
          }
        } else if (_callType == 'Incoming' &&
            isServiceAvailable &&
            isRepeatOver) {
          // _showNotification("Executing on call type: Incoming");

          // if(await WhatsappHandler.sendWP(phone: _phoneNumber!.replaceAll("+", ''))){
          //   // _showNotification("WhatsApp Sent Successfully");
          //   debugPrint("Executing on call type: Incoming");
          //   setNumberRepeat();
          // }
          //
          // if(await SmsHandler.sendMessage(_phoneNumber!)) {
          //   // _showNotification("SMS Sent Successfully");
          //   debugPrint("Executing on call type: Incoming");
          //   setNumberRepeat();
          // }
        } else if (isRepeatOver && isServiceAvailable) {
          debugPrint("Number is set to Repeat.");
        }
      }
    });
  }

  static Future<void> setNumberRepeat() async {
    try {
      await SharedPreferencesHelper.reload();
      String today = MyDateUtils.formatDate(DateTime.now());
      await RepeatNumberProvider.insertOrUpdate(_phoneNumber!, today);
      // debugPrint("$_phoneNumber has been set to repeat.");
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

  static Future<bool> checkNumberRepeat() async {
    try {
      await SharedPreferencesHelper.reload();
      var val = (await SharedPreferencesHelper.getString("repeatList") ?? "{}");
      var map = stringToMap(val);
      if (map.containsKey(_phoneNumber!)) {
        String repeatDate = map[_phoneNumber];
        String today = MyDateUtils.formatDate(DateTime.now());
        var repeat = double.parse(
                await SharedPreferencesHelper.getString("repeat") ?? "7.0")
            .toInt();
        int diff = MyDateUtils.getDifferenceInDays(
            MyDateUtils.parseDate(repeatDate), MyDateUtils.parseDate(today));
        // debugPrint("Repeat Date: $repeatDate. Today's Date : $today. Diff : $diff.");
        // debugPrint("Repeat : $repeat. Diff : $diff. Exp : ${diff > repeat}");
        return diff >= repeat;
      }
      return true;
    } catch (e) {
      debugPrint("Exception: $e");
      return false;
    }
  }

  static Future<bool> checkBlocklist() async {
    try {
      await SharedPreferencesHelper.reload();
      List<String> list = await SharedPreferencesHelper.getList('blocklist');
      if (_phoneNumber != null) {
        return (list.contains(_phoneNumber)) ? true : false;
      } else {
        throw Exception("Phone Number is NULL");
      }
    } catch (e) {
      debugPrint("Exception: $e");
      return false;
    }
  }

  static Future<bool> checkService() async {
    try {
      await SharedPreferencesHelper.reload();
      String? end = await SharedPreferencesHelper.getString("end");
      if (end != null) {
        int diff = MyDateUtils.getDifferenceInDays(
            DateTime.now(), MyDateUtils.parseDate(end));
        // debugPrint("Difference: $diff");
        return diff > -1 ? true : false;
      } else {
        debugPrint("No Active Subscription");
        return false;
      }
    } catch (e) {
      debugPrint("Exception in CallHandler: $e");
      return false;
    }
  }

  static void _showNotification(String callType,
      {String title = 'Call Detected', String desc = 'Call type:'}) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const int insistentFlag = 4;
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'com.callinfo.application.call_info',
      'Call Infos',
      channelDescription: 'Notification channel for call detection',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      additionalFlags: Int32List.fromList(<int>[insistentFlag]),
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      randomInteger(0, 100),
      title,
      callType.isNotEmpty ? '$desc $callType' : desc,
      platformChannelSpecifics,
    );
  }
}
