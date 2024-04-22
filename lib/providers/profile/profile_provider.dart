import 'dart:io';

import 'package:flutter/material.dart';

// Define a data class to represent the Profile data
class Profile {
  File? imageFile;
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
}
// Create a Singleton Provider class to manage the state of the Profile data
class ProfileProvider extends ChangeNotifier {
  static final ProfileProvider _instance = ProfileProvider._internal();

  factory ProfileProvider() {
    return _instance;
  }

  ProfileProvider._internal();

  static Profile? _profile;

  // Getter to access the current Profile data
  Profile? get profile => _profile;

  // Function to update the Profile data
  void updateProfile(Profile newProfile) {
    _profile = newProfile;
    notifyListeners(); // Notify listeners that the state has changed
    debugPrint('Saving Provider ${_profile!.vendorName}');
  }
}
