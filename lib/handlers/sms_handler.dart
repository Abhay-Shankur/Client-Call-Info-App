import 'package:background_sms/background_sms.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import '../providers/sms/sms_shared.dart';

class SmsHandler {

  // static SMSProvider provider = SMSProviderSingleton.instance;
  static const MethodChannel _channel = MethodChannel('com.callinfo.application.call_info/callType');

  void updatePermissionStatus(bool newStatus) {
    _channel.invokeMethod('updatePermissionStatus', {'permissionStatus': newStatus});
  }

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
    try {
      await SharedPreferencesHelper.reload();
      SMSMessageTemplate? message = await SMSMessageTemplate.getFromShared();
      bool allowed = await SharedPreferencesHelper.getBool("allowSMS");

      if(allowed) {
        if(message == null) {
          showNotification('CALL INFOS', 'SMS Template is Empty.');
          return false;
        }

        String msg = message.text;
        if (await isPermissionGranted()) {
          var isCustomSimSupported = await supportCustomSim;
          if (isCustomSimSupported != null && isCustomSimSupported) {
            var result = await BackgroundSms.sendMessage(
                phoneNumber: phoneNumber, message: msg, simSlot: simSlot);
            debugPrint("Sending SMS to $phoneNumber (${result.toString()})");
            return result == SmsStatus.sent;
          } else {
            var result = await BackgroundSms.sendMessage(
                phoneNumber: phoneNumber, message: msg);
            debugPrint("Sending SMS to $phoneNumber (${result.toString()})");
            return result == SmsStatus.sent;
          }
        } else {
          var granted = await requestPermission();
          if (granted) {
            var isCustomSimSupported = await supportCustomSim;
            if (isCustomSimSupported != null && isCustomSimSupported) {
              var result = await BackgroundSms.sendMessage(
                  phoneNumber: phoneNumber, message: msg, simSlot: simSlot);
              debugPrint("Sending SMS to $phoneNumber (${result.toString()})");
              return result == SmsStatus.sent;
            } else {
              var result = await BackgroundSms.sendMessage(
                  phoneNumber: phoneNumber, message: msg);
              debugPrint("Sending SMS to $phoneNumber (${result.toString()})");
              return result == SmsStatus.sent;
            }
          } else {
            return false;
          }
        }
      } else {
        return false;
      }
    } catch(e) {
      debugPrint("Error while Sending SMS: $e");
      return false;
    }
  }

}
