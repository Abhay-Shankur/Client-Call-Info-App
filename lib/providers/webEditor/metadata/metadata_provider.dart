import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

// Define a class to represent the data
class WebMetaDataProvider extends ChangeNotifier {
  String? _imageBanner;
  String? _ownerName ;
  String? _ownerContact ;
  String? _businessName ;
  String? _businessDescription ;
  String? _businessContact ;
  String? _businessAddress ;
  String? _businessMail ;

  // Getters for accessing the data
  String? get imageBanner => _imageBanner;
  String? get ownerName => _ownerName;
  String? get ownerContact => _ownerContact;
  String? get businessName => _businessName;
  String? get businessDescription => _businessDescription;
  String? get businessContact => _businessContact;
  String? get businessAddress => _businessAddress;
  String? get businessMail => _businessMail;

  // Constructor to set default value from Firestore
  WebMetaDataProvider() {
    // Call a function to fetch the default value from Firestore
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if (uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String domainName =
            await firestore.readFieldAtPath("USERS", uid, 'webDomain') ?? '';
        Map<String, dynamic> data = await firestore.readFieldAtPath(
            "Website", domainName, 'MasterData') as Map<String, dynamic>;
        debugPrint(data.toString());
        updateImageBanner(data['imageBanner']);
        // _ownerName = data['ownerName'];
        updateOwnerName(data['ownerName']);
        // _ownerContact = data['ownerContact'];
        updateOwnerContact(data['ownerContact']);
        // _businessName = data['businessName'];
        updateBusinessName(data['businessName']);
        // _businessContact = data['businessContact'];
        updateBusinessContact(data['businessContact']);
        // _businessMail = data['businessMail'];
        updateBusinessMail(data['businessMail']);
        // _businessAddress = data['businessAddress'];
        updateBusinessAddress(data['businessAddress']);
        // _businessDescription = data['businessDescription'];
        updateBusinessDescription(data['businessDescription']) ;
        debugPrint('Master Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebMetaDataProvider: $e');
    }
  }

  // Methods to update the data
  void updateImageBanner(String? value) {
    _imageBanner = value;
    notifyListeners();
  }

  void updateOwnerName(String? name) {
    _ownerName = name;
    notifyListeners();
  }

  void updateOwnerContact(String? contact) {
    _ownerContact = contact;
    notifyListeners();
  }

  void updateBusinessName(String? name) {
    _businessName = name;
    notifyListeners();
  }

  void updateBusinessDescription(String? desc) {
    _businessDescription = desc;
    notifyListeners();
  }

  void updateBusinessContact(String? contact) {
    _businessContact = contact;
    notifyListeners();
  }

  void updateBusinessAddress(String? address) {
    _businessAddress = address;
    notifyListeners();
  }

  void updateBusinessMail(String? mail) {
    _businessMail = mail;
    notifyListeners();
  }
}
