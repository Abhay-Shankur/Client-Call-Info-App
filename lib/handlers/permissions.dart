// import 'package:call_log_access_app/screens/tabs_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:call_log_access_app/helpers.dart';

class AppPermissions {
  late BuildContext localContext;

  AppPermissions(this.localContext);

  void checkPermission() async {
    PermissionStatus statusPhone = await Permission.phone.status;
    PermissionStatus statusContacts = await Permission.contacts.status;

    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    }
    if (statusContacts.isPermanentlyDenied || statusPhone.isPermanentlyDenied) {
      await openAppSettings();
      _closeApp();
    } else {
      _getCallsPermissions();
    }
  }

  void _getCallsPermissions() async {
    PermissionStatus statusPhone = await Permission.phone.request();
    PermissionStatus statusContacts = await Permission.contacts.request();

    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    }
    if (statusContacts.isPermanentlyDenied || statusPhone.isPermanentlyDenied) {
      await openAppSettings();
      _closeApp();
    } else {
      // setState(() {
      //   content = messenger(
      //       closeAppFunction: _closeApp, allowFunction: _getCallsPermissions);
      // });
    }
  }

  void _openTabsScreen() {
    // Navigator.of(localContext).pushReplacement(MaterialPageRoute(
    //   // builder: (context) => const TabsScreen(),
    // ));
  }

  void _closeApp() {
    SystemNavigator.pop();
  }
}
