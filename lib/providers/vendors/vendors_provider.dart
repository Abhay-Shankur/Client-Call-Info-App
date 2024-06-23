
import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/material.dart';

class VendorsListProvider extends ChangeNotifier {
  // List<Map<String, dynamic>> list = [];
  List<String> ids = [];
  Map<String, dynamic> vendors = {};

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
    FirestoreHandler firestore = FirestoreHandler();
    try {
      ids = await firestore.getDocumentNames("USERS") ?? [];
      notifyListeners();
      for (var id in ids) {
        Map<String, dynamic> value = await firestore.readFirestoreData("USERS", id);
        addVendor({id : value as dynamic});
        notifyListeners();
      }
      firestore.closeConnection();
      debugPrint("Provider Loaded : VendorsListProvider");
      // debugPrint("List: ${list.toString()}");
    } catch (e) {
      firestore.closeConnection();
      debugPrint("Exception: $e");
    }
  }

  void addVendor(Map<String, dynamic> v){
    // list.add(v);
    vendors.addAll(v);
    notifyListeners();
  }

  dynamic getVendor(String id) {
    return vendors[id];
  }

  Future<void> updateVendor(String id) async {
    FirestoreHandler fh = FirestoreHandler();
    try {
      Map<String,dynamic> data = await fh.readFirestoreData("USERS", id);
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