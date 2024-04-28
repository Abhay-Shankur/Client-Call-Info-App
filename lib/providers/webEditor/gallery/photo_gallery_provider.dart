import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';

class WebPhotoGalleryProvider extends ChangeNotifier {
  List<String> _list = [];

  WebPhotoGalleryProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null){
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain') ?? null;
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, 'Gallery/Photos') ?? [];
        debugPrint('PhotoGallery: ${dynlist.toString()}');
        dynlist.forEach((element) {
          if (element is String) { // Check if the element is a string
            _list.add(element); // Add the element to the list if it's a string
            notifyListeners();
          }
        });
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint("Exception: $e");

    }
  }

  List<String> get list => _list;

  void updateList(List<String> value) {
    _list = value;
    notifyListeners();
  }
}