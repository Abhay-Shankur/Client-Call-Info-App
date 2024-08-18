import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  static Future<void> requestAll() async {
    // await [
    //   Permission.phone,
    //   Permission.contacts,
    //   Permission.sms,
    // ].request();
    Permission.phone.request();
    Permission.contacts.request();
    Permission.sms.request();
  }

  static Future<bool> requestContactsPermission() async {
    try{
      return await Permission.contacts.request().isGranted;
    } catch(e) {
      debugPrint("Exception: $e");
      return false;
    }
  }
}
