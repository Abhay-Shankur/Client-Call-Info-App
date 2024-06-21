import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
  String? created;
  String? start;
  String? end;
  String? type;

  SubscriptionProvider(){
    _init();
  }

  Future<bool> initialize() async {
    try {
      await _init();
      return true;
    } catch(e) {
      return false;
    }
  }

  Future<void> _init() async {
    FirestoreHandler fh = FirestoreHandler();
    try {
      final id = FirebaseAuthHandler.getCurrentUser()?.uid;
      final data = await fh.readFieldAtPath("USERS", id!, "Subscription");
      if(data != null) {
        created = data['created'];
        start = data['start'];
        end = data['end'];
        type = data['type'];
        await updateShared();
      }
      fh.closeConnection();
      notifyListeners();
      debugPrint("Subscription Provider Updated.");
    } catch(e) {
      fh.closeConnection();
      debugPrint("Exception: $e");
    }
  }

  Future<void> updateCreated(String value) async {
    created = value;
    await updateShared();
    notifyListeners();
  }

  Future<void> updateStart(String value) async {
    start = value;
    await updateShared();
    notifyListeners();
  }

  Future<void> updateEnd(String value) async {
    end = value;
    await updateShared();
    notifyListeners();
  }

  Future<void> updateType(String value) async {
    type = value;
    await updateShared();
    notifyListeners();
  }

  Future<void> updateShared() async {
    if(start != null) await SharedPreferencesHelper.setString("start", start!);
    if(end != null)await SharedPreferencesHelper.setString("end", end!);
    if(created != null)await SharedPreferencesHelper.setString("created", created!);
    if(type != null)await SharedPreferencesHelper.setString("type", type!);
  }
}