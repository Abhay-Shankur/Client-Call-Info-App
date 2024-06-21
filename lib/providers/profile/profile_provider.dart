
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

// Define a data class to represent the Profile data
class Profile {
  String? imageFile;
  String? vendorName;
  String? vendorEmail;
  String? vendorContact;
  String? businessName;
  String? businessDescription;

  Profile({
    this.imageFile,
    this.vendorName,
    this.vendorEmail,
    this.vendorContact,
    this.businessName,
    this.businessDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageFile': imageFile,
      'vendorName': vendorName,
      'vendorEmail': vendorEmail,
      'vendorContact': vendorContact,
      'businessName': businessName,
      'businessDescription': businessDescription,
    };
  }

  factory Profile.fromJson(Map<String,dynamic> map) {
    return Profile(
      imageFile: map['imageFile'],
      vendorName: map['vendorName'],
      vendorEmail: map['vendorEmail'],
      vendorContact: map['vendorContact'],
      businessName: map['businessName'],
      businessDescription: map['businessDescription']
    );
  }
}
// Create a Singleton Provider class to manage the state of the Profile data
class ProfileProvider extends ChangeNotifier {
  Profile? _profile;

  ProfileProvider() {
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

  Future<void> _init() async{
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic>? data = await firestore.readFieldAtPath("USERS", uid, 'Profile');
        if(data != null) {
          _profile = Profile.fromJson(data);
          notifyListeners();
        }
        debugPrint('Profile Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize ProfileProvider: $e');
    }
  }

  Profile? get profile => _profile;

  void updateProfile(Profile profile) {
    _profile = profile;
    notifyListeners();
  }

}
