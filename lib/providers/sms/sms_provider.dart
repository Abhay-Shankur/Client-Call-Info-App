
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/providers/sms/sms_shared.dart';
import 'package:flutter/material.dart';

class SMSProvider extends ChangeNotifier {
  bool _allowed = false;
  String? _text;

  SMSProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic>? data = await firestore.readFieldAtPath("USERS", uid, 'SMS') ?? null;
        if(data != null) {
          _allowed = data['allowed'];
          _text = data['text'];
          notifyListeners();
        }
        debugPrint('SMS Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
        await SharedPreferencesHelper.setBool('allowSMS', _allowed);
        if(_text != null)
          SMSMessageTemplate(text: _text!).saveToShared();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize SMSProvider: $e');
    }
  }

  String? get text => _text;

  bool get allowed => _allowed;

  void updateText(String text) {
    _text = text;
    notifyListeners();
  }

  Future<void> updateAllowed(bool value) async {
    try {
      _allowed = value;
      notifyListeners();
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic>? data = {
          'SMS' : {
            'allowed' : _allowed,
          }
        };
        await firestore.updateFirestoreData("USERS", uid, data);
        await SharedPreferencesHelper.setBool('allowSMS', _allowed);
        //TODO:
        // SmsHandler().updatePermissionStatus(_allowed);
        debugPrint('SMS Data Saved to Firestore.');
        firestore.closeConnection();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Exception : $e');
    }
  }

  // Method to retrieve the latest value
  Future<bool> getLatestValue() async {
    // Simulate asynchronous operation
    await Future.delayed(Duration(seconds: 1));
    return _allowed;
  }
}

// class SMSProviderSingleton {
//   static final SMSProvider _instance = SMSProvider();
//
//   static SMSProvider get instance => _instance;
// }