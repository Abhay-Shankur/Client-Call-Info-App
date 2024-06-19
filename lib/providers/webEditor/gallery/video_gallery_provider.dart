import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';

class WebVideoGalleryProvider extends ChangeNotifier {
  List<String> _list = [];

  WebVideoGalleryProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if(uid != null){
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, 'Gallery/Videos') ?? [];
        debugPrint('VideoGallery: ${dynlist.toString()}');
        for (var element in dynlist) {
          if (element is String) { // Check if the element is a string
            _list.add(element); // Add the element to the list if it's a string
            notifyListeners();
          }
        }
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint("Failed to initialize WebVideoGalleryProvider: $e");

    }
  }

  List<String> get list => _list;

  void updateList(List<String> value) {
    _list = value;
    notifyListeners();
  }
}