
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
      String? domain = await fh.readFieldAtPath("USERS", id, "webDomain");
      if(domain != null && domain.isNotEmpty) {
        await FirebaseStorageService.deleteFolder(domain);
        await fh.deleteFirestoreData("Website", domain);
        await fh.removeField("USERS", id, "webDomain");
        await Provider.of<VendorsListProvider>(localContext, listen: false).updateVendor(id);
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
      await FirebaseStorageService.deleteFolder("Users/$id");
      await fh.deleteFirestoreData("USERS", id);
      await Provider.of<VendorsListProvider>(localContext, listen: false).deleteVendor(id);
      fh.closeConnection();
      return true;
    } catch(e) {
      debugPrint("Exception: $e");
      fh.closeConnection();
      return false;
    }
  }
}
