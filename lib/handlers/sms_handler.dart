import 'package:background_sms/background_sms.dart';
import 'package:permission_handler/permission_handler.dart';

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

  static Future<bool> sendMessage(String phoneNumber, String message,
      {int? simSlot}) async {
    if (await isPermissionGranted()) {
      var isCustomSimSupported = await supportCustomSim;
      if (isCustomSimSupported != null && isCustomSimSupported) {
        var result = await BackgroundSms.sendMessage(
            phoneNumber: phoneNumber, message: message, simSlot: simSlot);
        return result == SmsStatus.sent;
      } else {
        var result = await BackgroundSms.sendMessage(
            phoneNumber: phoneNumber, message: message);
        return result == SmsStatus.sent;
      }
    } else {
      var granted = await requestPermission();
      if (granted) {
        var isCustomSimSupported = await supportCustomSim;
        if (isCustomSimSupported != null && isCustomSimSupported) {
          var result = await BackgroundSms.sendMessage(
              phoneNumber: phoneNumber, message: message, simSlot: simSlot);
          return result == SmsStatus.sent;
        } else {
          var result = await BackgroundSms.sendMessage(
              phoneNumber: phoneNumber, message: message);
          return result == SmsStatus.sent;
        }
      } else {
        return false;
      }
    }
  }
}
