import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:call_info/handlers/connectivity_service.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/main.dart';

Future<void> handleBackgroundNotification(RemoteMessage message) async {
  debugPrint('Notification Title: ${message.notification?.title}');
  debugPrint('Notification Body: ${message.notification?.body}');
  debugPrint('Notification Payload: ${message.data}');
}

class FirebaseMessagingHandler {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static late NotificationSettings notificationSettings;


  static get firebaseMessaging => _firebaseMessaging;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notification',
      importance: Importance.defaultImportance);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // await FirebaseMessaging.instance.setAutoInitEnabled(true);

    notificationSettings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,);
    if(notificationSettings.authorizationStatus == AuthorizationStatus.denied) {
      notificationSettings = await _firebaseMessaging.requestPermission(provisional: true);
    }

// TODO:For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
//     final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//     if (apnsToken != null) {
//       // APNS token is available, make FCM plugin API requests...
//     }
    if(await ConnectivityService.isConnected()) {
      var fCMToken = await _firebaseMessaging.getToken();
      await SharedPreferencesHelper.saveDeviceToken(fCMToken!);
      debugPrint('Device Token: $fCMToken');
    }
    initPushNotification();
    // initLocalNotification();
  }

  Future<void> getToken() async {
    try {
      // checkDeviceToken(fCMToken);
      // If notifications are disabled, request permission
      if (notificationSettings.authorizationStatus == AuthorizationStatus.notDetermined) {
        notificationSettings = await _firebaseMessaging.requestPermission(provisional: true);
        var fCMToken = await _firebaseMessaging.getToken();
        await SharedPreferencesHelper.saveDeviceToken(fCMToken!);
        debugPrint('Device Token: $fCMToken');
      }

      // TODO: await sendDeviceId();
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  // Future<void> checkDeviceToken(String token) async {
  //   try {
  //     String? userUid = FirebaseAuthHandler.getCurrentUser()?.uid;
  //     if (userUid != null) {
  //       FirestoreOperations fsOp = FirestoreOperations();
  //       Map<String, dynamic>? user =
  //           await fsOp.readFirestoreData('USER', userUid);
  //       if (user!.containsKey('device') &&
  //           user['device']!.toString() != token) {
  //         await sendDeviceId();
  //       }
  //       fsOp.closeConnection();
  //     }
  //   } catch (e) {
  //     throw FormatException('$e');
  //   }
  // }

  // Future<void> sendDeviceId() async {
  //   try {
  //     String endPoint = 'https://mitconskills.in/api/storedevice';
  //     Map<String, dynamic> requestBody = {
  //       'phone': await SharedPreferencesHelper.getString('phone'),
  //       'device': await SharedPreferencesHelper.getDeviceToken()
  //     };
  //
  //     ApiHandler apiHandler = ApiHandler();
  //
  //     Map<String, dynamic> responseBody =
  //         await apiHandler.postRequest(endPoint, requestBody);
  //
  //     if (responseBody.isNotEmpty && responseBody['success'] as bool) {
  //       String? userUid = FirebaseAuthHandler.getCurrentUser()?.uid;
  //
  //       FirestoreOperations fsOp = FirestoreOperations();
  //       await fsOp.updateFirestoreData('USER', userUid!, requestBody);
  //       fsOp.closeConnection();
  //
  //       debugPrint(requestBody.toString());
  //       debugPrint(responseBody['message']);
  //     } else {
  //       debugPrint('Something went wrong while sending Device Token');
  //     }
  //   } catch (e) {
  //     debugPrint('Send Device Id: $e');
  //     throw FormatException('$e');
  //   }
  // }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    //TODO: Set the push name
    navigator.currentState?.pushNamed('/home', arguments: message);
  }

  Future initPushNotification() async {
    //Useful for IOS
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@drawable/ic_launcher',
        )),
        payload: jsonEncode(event.toMap()),
      );
    });
  }
}
