import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class WebServices {
  String? image;
  String? heading;
  String? description;

  WebServices({
    required this.image,
    required this.heading,
    required this.description
  });

  // Factory method to create an instance from a Map<String, dynamic>
  factory WebServices.fromMap(Map<String, dynamic> map) {
    return WebServices(
        image: map['image'],
        heading: map['heading'],
        description: map['description']
    );
  }
}
class WebServicesProvider extends ChangeNotifier {
  final List<WebServices> _list = [];

  WebServicesProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, "Services") ?? [];
        for (var element in dynlist) {
          if(element is Map<String,dynamic>){
            WebServices res = WebServices.fromMap(element);
            _list.add(res);
            notifyListeners();
          }
        }
        firestore.closeConnection();
        debugPrint('Services Data Initialized.');
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebServicesProvider: $e');
    }
  }

  List<WebServices> get list => _list;

  void updateList(WebServices services) {
    _list.add(services);
    notifyListeners();
  }

  void removeAt(int index) {
    if(index < _list.length){
      _list.removeAt(index);
      notifyListeners();
    }
  }
}