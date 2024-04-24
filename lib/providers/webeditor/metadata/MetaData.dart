import 'package:flutter/material.dart';

// Define a class to represent the data
class MetaDataProvider extends ChangeNotifier {
  String _ownerName = '';
  String _ownerContact = '';
  String _businessName = '';
  String _businessContact = '';
  String _businessAddress = '';
  String _businessMail = '';

  // Getters for accessing the data
  String get ownerName => _ownerName;
  String get ownerContact => _ownerContact;
  String get businessName => _businessName;
  String get businessContact => _businessContact;
  String get businessAddress => _businessAddress;
  String get businessMail => _businessMail;

  // Methods to update the data
  void updateOwnerName(String name) {
    _ownerName = name;
    notifyListeners();
  }

  void updateOwnerContact(String contact) {
    _ownerContact = contact;
    notifyListeners();
  }

  void updateBusinessName(String name) {
    _businessName = name;
    notifyListeners();
  }

  void updateBusinessContact(String contact) {
    _businessContact = contact;
    notifyListeners();
  }

  void updateBusinessAddress(String address) {
    _businessAddress = address;
    notifyListeners();
  }

  void updateBusinessMail(String mail) {
    _businessMail = mail;
    notifyListeners();
  }
}
