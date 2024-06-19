import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class WebWeHelpProvider extends ChangeNotifier {
  //TODO: Remove Images;
  String? _image1;
  String? _image2;
  String? _image3;
  String? _heading;
  String? _description;

  WebWeHelpProvider(){
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        Map<String,dynamic>? data = await firestore.readFieldAtPath("Website", domainName, "WeHelp");
        if(data != null) {
          _heading = data['heading'];
          _description = data['description'];
        }
        firestore.closeConnection();
        debugPrint('WeHelpTo Data Initialized.');
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebWeHelpProvider: $e');
    }
  }

  String? get description => _description;

  void  updateDescription(String value) {
    _description = value;
    notifyListeners();
  }

  String? get heading => _heading;

  void updateHeading(String value) {
    _heading = value;
    notifyListeners();
  }

  String? get image3 => _image3;

  void updateImage3(String value) {
    _image3 = value;
    notifyListeners();
  }

  String? get image2 => _image2;

  void updateImage2(String value) {
    _image2 = value;
    notifyListeners();
  }

  String? get image1 => _image1;

  void updateImage1(String value) {
    _image1 = value;
    notifyListeners();
  }
}