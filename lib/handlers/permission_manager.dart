import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  static Future<void> requestAll() async {
    await Permission.phone.request();
    await Permission.contacts.request();
    await Permission.sms.request();
  }

}
