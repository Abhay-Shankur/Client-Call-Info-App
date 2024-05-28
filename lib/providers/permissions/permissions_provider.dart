import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../firebaseHandlers/firebase_messaging.dart';

class PermissionsProvider extends ChangeNotifier {
  bool notifications = false;
  bool calls = false;
  bool storage = false;
  bool contacts = false;
  bool sms = false;

  PermissionsProvider () {
    _init();
  }

  Future<void> _init() async {
    NotificationSettings settings = await FirebaseMessaging.instance.getNotificationSettings();
    if(settings.authorizationStatus == AuthorizationStatus.authorized) notifications = true;
    calls = await Permission.phone.isGranted;
    contacts = await Permission.contacts.isGranted;
    sms = await Permission.sms.isGranted;
    storage = await Permission.storage.isGranted;
    notifyListeners();
  }

  void updateNotification(bool value) {
    notifications = value;
    notifyListeners();
  }

  void updateCalls(bool value) {
    calls = value;
    notifyListeners();
  }

  void updateStorage(bool value) {
    storage = value;
    notifyListeners();
  }

  void updateContacts(bool value) {
    contacts = value;
    notifyListeners();
  }
}