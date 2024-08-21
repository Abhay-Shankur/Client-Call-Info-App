
import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class VendorsListProvider extends ChangeNotifier {
  // List<Map<String, dynamic>> list = [];
  List<String> ids = [];
  Map<String, dynamic> users = {};
  Map<String, Map<String,dynamic>?> vendors = {};

  VendorsListProvider() {
    _init();
  }

  Future<bool> initialize() async {
    try {
      await _init();
      return true;
    } catch (e) {
      debugPrint("Exception : $e");
      return false;
    }
  }

  Future<void> _init() async {
    try {
      FirestoreHandler firestore = FirestoreHandler();
      users = await firestore.readFirestoreData("ADMIN", "USERS");
      ids = users.keys.toList();
      notifyListeners();
      for (var id in ids) {
        debugPrint("id: $id, value: ${users[id]}");
        if(users[id] != null) {
          dynamic value = await firestore.readFirestoreData("USERS", users[id] as String);
          debugPrint("Value for $id : ${value.toString()}");
          addVendor({id : value as dynamic});
        } else {
          addVendor({id : null});
        }
        // users[id] = value;
        // vendors.update(id, value);
        // addVendor({id : value as dynamic});
        notifyListeners();
      }
      notifyListeners();

      // for(var phone in users.keys.toList()){
      //   dynamic uid = users[phone];
      //   dynamic value;
      //   if(uid != null) {
      //     debugPrint("uid: $uid");
      //     value = await firestore.readFirestoreData("USERS", uid);
      //   }
      //   addVendor({phone : value as dynamic});
      //   notifyListeners();
      // }
      // users.forEach((phone, uid) async {
      //   dynamic value;
      //   if(uid != null) {
      //     value = await firestore.readFirestoreData("USERS", uid);
      //   }
      //   addVendor({phone : value as dynamic});
      //   notifyListeners();
      // });
      firestore.closeConnection();
      debugPrint("Provider Loaded : VendorsListProvider");
      // debugPrint("List: ${list.toString()}");
    } catch (e) {
      // firestore.closeConnection();
      debugPrint("Exception: $e");
    }
  }

  void addVendor(Map<String, Map<String, dynamic>?> v){
    // list.add(v);
    vendors.addAll(v);
    notifyListeners();
  }

  dynamic getVendor(String id) {
    return vendors[id];
  }

  Future<void> updateVendor(String uid, String id) async {
    FirestoreHandler fh = FirestoreHandler();
    try {
      Map<String,dynamic> data = await fh.readFirestoreData("USERS", uid);
      fh.closeConnection();
      vendors.addAll({id : data});
      notifyListeners();
      debugPrint("Update Vendor.");
    } catch(e) {
      fh.closeConnection();
      debugPrint("Exception : $e");
    }
  }

  Future<void> deleteVendor(String id) async {
    try {
      vendors.remove(id);
      notifyListeners();
    } catch(e) {
      debugPrint("Exception: $e");
    }
  }
}