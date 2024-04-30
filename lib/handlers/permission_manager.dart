import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  static void _closeApp() {
    SystemNavigator.pop();
  }

  static Future<void> requestAll() async {
    // await Permission.storage.request();
    // await Permission.manageExternalStorage.request();
    // await Permission.camera.request();
    // await Permission.microphone.request();

    await Permission.phone.request();
    await Permission.contacts.request();
    await Permission.sms.request();
  }

  static Future<bool> requestStoragePermission(BuildContext context) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      if (status.isPermanentlyDenied) {
        await openAppSettings();
        _closeApp();
      }
      return false;
    }
  }

  static Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    return status.isGranted;
  }

  static Future<bool> requestReadWriteStoragePermission() async {
    // Request storage permission
    final statusStorage = await Permission.storage.request();
    if (!statusStorage.isGranted) {
      // Storage permission not granted
      if (statusStorage.isPermanentlyDenied) {
        // Storage permission permanently denied, open app settings
        await openAppSettings();
        _closeApp();
      }
      return false;
    }

    // Request manage external storage permission
    final statusManageExternalStorage = await Permission.manageExternalStorage
        .request();
    if (!statusManageExternalStorage.isGranted) {
      // Manage external storage permission not granted
      if (statusManageExternalStorage.isPermanentlyDenied) {
        // Manage external storage permission permanently denied, open app settings
        await openAppSettings();
        _closeApp();
      }
      return false;
    }

    // Both permissions granted
    return true;
  }

  static Future<bool> checkReadWriteStoragePermission() async {
    var status = await Permission.storage.status;
    var manageExternalStorageStatus = await Permission.manageExternalStorage
        .status;

    return status.isGranted && manageExternalStorageStatus.isGranted;
  }

}
