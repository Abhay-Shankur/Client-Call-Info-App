import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class Links {
  String whatsappLink = '';
  String instagramLink = '';
  String facebookLink = '';

  Links({
    required this.whatsappLink,
    required this.instagramLink,
    required this.facebookLink
  });

  // Method to convert object into Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'whatsappLink': whatsappLink,
      'instagramLink': instagramLink,
      'facebookLink': facebookLink,
    };
  }
  
  // Factory method to create an instance from a Map<String, dynamic>
  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      whatsappLink: map['whatsappLink'],
      instagramLink: map['instagramLink'],
      facebookLink: map['facebookLink'],
    );
  }
}

class WebLinksProvider extends ChangeNotifier {
  Links? _links = null;

  WebLinksProvider(){
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String _domainName = await firestore.readFieldAtPath("USERS", uid, "webDomain") ?? null;
        Map<String,dynamic>? data = await firestore.readFieldAtPath("Website", _domainName, "Links") ?? null;
        if(data != null) _links = Links.fromMap(data);
        firestore.closeConnection();
        debugPrint('Links Data Initialized.');
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebLinksProvider: $e');
    }
  }

  Links? get links => _links;

  void updateLinks(Links links){
    _links = links;
    notifyListeners();
  }
}