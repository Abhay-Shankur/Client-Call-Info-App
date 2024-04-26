import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

// Define a class to represent the data
class WebDomainProvider extends ChangeNotifier {
  String _domainName = '';

  // Getters for accessing the data
  String get domainName => _domainName;

  // Constructor to set default value from Firestore
  WebDomainProvider() {
    // Call a function to fetch the default value from Firestore
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        _domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        firestore.closeConnection();
        debugPrint('Domain Data Initialized.');
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebDomainProvider: $e');
    }
  }

  void updateDomainName(String value) {
    _domainName = value;
    notifyListeners();
  }

}
