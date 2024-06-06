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

  Future<void> _init() async {
    FirestoreHandler fh = FirestoreHandler();
    try {
      final id = FirebaseAuthHandler.getCurrentUser()?.uid;
      final data = await fh.readFieldAtPath("USERS", id!, "Subscription");
      if(data != null) {
        created = data['created'] ?? null;
        start = data['start'] ?? null;
        end = data['end'] ?? null;
        type = data['type'] ?? null;
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

  void updateCreated(String value) {
    created = value;
    notifyListeners();
  }

  void updateStart(String value) {
    start = value;
    notifyListeners();
  }

  void updateEnd(String value) {
    end = value;
    notifyListeners();
  }

  void updateType(String value) {
    type = value;
    notifyListeners();
  }

  Future<void> updateShared() async {
    await SharedPreferencesHelper.setString("start", start!);
    await SharedPreferencesHelper.setString("end", end!);
    await SharedPreferencesHelper.setString("created", created!);
    await SharedPreferencesHelper.setString("type", type!);
  }
}