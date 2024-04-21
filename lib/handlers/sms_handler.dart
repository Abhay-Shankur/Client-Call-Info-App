import 'package:background_sms/background_sms.dart';
import 'package:call_info/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../providers/sms/sms_shared.dart';

class SmsHandler {

  static Future<bool> requestPermission() async {
    var permissions = await [Permission.sms].request();
    return permissions[Permission.sms] == PermissionStatus.granted;
  }

  static Future<bool> isPermissionGranted() async {
    var status = await Permission.sms.status;
    return status.isGranted;
  }

  static Future<bool?> get supportCustomSim async =>
      await BackgroundSms.isSupportCustomSim;

  static Future<bool> sendMessage(String phoneNumber, {int? simSlot}) async {

    SMSMessageTemplate? _message = await SMSMessageTemplate.getFromShared();
    // String msg = await SharedPreferencesHelper.getString('smsMsg');
    if(_message != null) {
      String msg = _message.text;
      debugPrint('Phone: $phoneNumber, Msg: $msg');
      if (await isPermissionGranted()) {
        var isCustomSimSupported = await supportCustomSim;
        if (isCustomSimSupported != null && isCustomSimSupported) {
          var result = await BackgroundSms.sendMessage(
              phoneNumber: phoneNumber, message: msg, simSlot: simSlot);
          return result == SmsStatus.sent;
        } else {
          var result = await BackgroundSms.sendMessage(
              phoneNumber: phoneNumber, message: msg);
          return result == SmsStatus.sent;
        }
      } else {
        var granted = await requestPermission();
        if (granted) {
          var isCustomSimSupported = await supportCustomSim;
          if (isCustomSimSupported != null && isCustomSimSupported) {
            var result = await BackgroundSms.sendMessage(
                phoneNumber: phoneNumber, message: msg, simSlot: simSlot);
            return result == SmsStatus.sent;
          } else {
            var result = await BackgroundSms.sendMessage(
                phoneNumber: phoneNumber, message: msg);
            return result == SmsStatus.sent;
          }
        } else {
          return false;
        }
      }
    } else {
      debugPrint('Message Empty');
      return false;
    }
  }

}
