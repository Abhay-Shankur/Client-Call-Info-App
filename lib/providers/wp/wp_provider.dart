
import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:flutter/material.dart';

class WPProvider extends ChangeNotifier {
  bool _allowed = false;
  String? _text;
  String? _image;
  String? _authKey;
  String? _instanceId;

  WPProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic>? data = await firestore.readFieldAtPath("USERS", uid, 'Whatsapp') ?? null;
        if(data != null) {
          _allowed = data['allowed'] ?? false;
          _text = data['text'] ?? null;
          _image = data['image'] ?? null;
          _authKey = data['AUTH_KEY'] ?? null;
          _instanceId = data['instance_id'] ?? null;
          notifyListeners();
        }
        debugPrint('Whatsapp Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
        await SharedPreferencesHelper.setBool('allowWP', _allowed);
        if(_text != null && _image != null)
          WPMessageTemplate(text: _text!, image: _image!).saveToShared();
        if(_authKey != null ) await SharedPreferencesHelper.setString('AUTH_KEY', _authKey!);
        if(_instanceId != null ) await SharedPreferencesHelper.setString('instance_id', _instanceId!);
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WPProvider: $e');
    }
  }

  bool get allowed => _allowed;

  String? get text => _text;

  String? get image => _image;

  String? get accessToken => _authKey;

  String? get instanceId => _instanceId;

  Future<void> updateAllowed(bool value) async {
    try {
      _allowed = value;
      notifyListeners();
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic>? data = {
          'Whatsapp' : {
            'allowed' : _allowed,
          }
        };
        await firestore.updateFirestoreData("USERS", uid, data);
        await SharedPreferencesHelper.setBool('allowWP', _allowed);
        debugPrint('Whatsapp Data Saved to Firestore.');
        firestore.closeConnection();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Exception : $e');
    }
  }

  Future<void> updateText(String text) async {
    _text = text;
    notifyListeners();
  }

  Future<void> updateImage(String value) async {
    _image = value;
    notifyListeners();
  }

  Future<void> updateAccessToken(String value) async {
    _authKey = value;
    notifyListeners();
  }

  Future<void> updateInstanceId(String value) async {
    _instanceId = value;
    notifyListeners();
  }

}