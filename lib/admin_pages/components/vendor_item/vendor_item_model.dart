import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'vendor_item_widget.dart' show VendorItemWidget;
import 'package:flutter/material.dart';

class VendorItemModel extends FlutterFlowModel<VendorItemWidget> {
  late BuildContext localContext;
  late String image;
  late String name;
  late String phone;
  late String subscription;
  bool flag = false;

  @override
  void initState(BuildContext context) {
    localContext = context;
  }

  @override
  void dispose() {}

  // Future<void> getDetails(String id) async {
  //   // FirestoreHandler firestore = FirestoreHandler();
  //   // try {
  //   //   name = await firestore.readFieldAtPath("USERS", id, "Profile.businessName", separator: ".");
  //   //   phone = await firestore.readFieldAtPath("USERS", id, "Profile.vendorContact", separator: ".");
  //   //   image = await firestore.readFieldAtPath("USERS", id, "Profile.imageFile", separator: ".");
  //   //   subscription = await firestore.readFieldAtPath("USERS", id, "Subscription.ends", separator: ".") ?? '';
  //   //   int dif = DateTime.now().difference(DateTime.parse(subscription)).inDays;
  //   //   debugPrint("Diff for $id : $dif");
  //   //   firestore.closeConnection();
  //   // } catch (e) {
  //   //   firestore.closeConnection();
  //   //   debugPrint("Exception: $e");
  //   // }
  // }

}
