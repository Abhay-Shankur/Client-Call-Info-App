import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class Reviews {
  String? name;
  String? description;

  Reviews({
    required this.name,
    required this.description
  });

  // Factory method to create an instance from a Map<String, dynamic>
  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      name: map['name'],
      description: map['description']
    );
  }
}

class WebReviewsProvider extends ChangeNotifier {
  List<Reviews> _list = [];

  WebReviewsProvider () {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String _domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain') ?? null;
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", _domainName, "Reviews") ?? [];
        dynlist.forEach((element) {
          if(element is Map<String,dynamic>){
            Reviews _r = Reviews.fromMap(element);
            _list.add(_r);
            notifyListeners();
          }
        });
        firestore.closeConnection();
        debugPrint('Reviews Data Initialized.');
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebReviewsProvider: $e');
    }
  }

  List<Reviews> get list => _list;

  void updateList(List<Reviews> value) {
    _list = value;
    notifyListeners();
  }

  void removeAt(int index) {
    if(index < _list.length){
      _list.removeAt(index);
      notifyListeners();
    }
  }
}