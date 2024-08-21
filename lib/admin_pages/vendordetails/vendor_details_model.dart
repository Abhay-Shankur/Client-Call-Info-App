
import 'package:app/firebaseHandlers/firebase_auth.dart';
import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:app/firebaseHandlers/firebase_storage.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'vendor_details_widget.dart' show VendorDetailsWidget;
import 'package:flutter/material.dart';

class VendorDetailsModel extends FlutterFlowModel<VendorDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  late BuildContext localContext;

  @override
  void initState(BuildContext context) {
    localContext = context;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  Future<void> deleteWebSite(String id) async {
    // await Future.delayed(const Duration(seconds: 5));
    FirestoreHandler fh = FirestoreHandler();
    try {
      String uid = await Provider.of<VendorsListProvider>(localContext, listen: false).users[id];
      String? domain = await fh.readFieldAtPath("USERS", uid, "webDomain");
      if(domain != null && domain.isNotEmpty) {
        await FirebaseStorageService.deleteFolder(domain);
        await fh.deleteFirestoreData("Website", domain);
        await fh.removeField("USERS", uid, "webDomain");
        await Provider.of<VendorsListProvider>(localContext, listen: false).updateVendor(uid,id);
      }
      fh.closeConnection();
    } catch(e) {
      debugPrint("Exception: $e");
      fh.closeConnection();
    }
  }

  Future<bool> deleteVendor(String id) async {
    // await Future.delayed(const Duration(seconds: 5));
    FirestoreHandler fh = FirestoreHandler();
    try {
      // String uid = FirebaseAuthHandler.getUid()!;
      String uid = await Provider.of<VendorsListProvider>(localContext, listen: false).users[id];
      await fh.deleteFirestoreData("USERS", uid);
      await FirebaseStorageService.deleteFolder("Users/$uid");

      // var users = await fh.readFirestoreData("ADMIN", "USERS");
      final vendor = await Provider.of<VendorsListProvider>(localContext, listen: false).getVendor(id);
      var domain = vendor['webDomain'];
      if(domain != null) {
        await FirebaseStorageService.deleteFolder("$domain");
        await fh.deleteFirestoreData("Website", domain);
      }
      await fh.removeField("ADMIN", "USERS", uid);

      // final phone = vendor["Profile"]["vendorContact"].toString();
      // await fh.removeField("ADMIN", "USERS", phone);
      // await Provider.of<VendorsListProvider>(localContext, listen: false).deleteVendor(id);
      fh.closeConnection();
      return true;
    } catch(e) {
      debugPrint("Exception: $e");
      fh.closeConnection();
      return false;
    }
  }
}
