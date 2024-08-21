import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:app/utils/date_utils.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'edit_subscription_widget.dart' show EditSubscriptionWidget;
import 'package:flutter/material.dart';

class EditSubscriptionModel extends FlutterFlowModel<EditSubscriptionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for subscriptionType widget.
  FocusNode? subscriptionTypeFocusNode;
  TextEditingController? subscriptionTypeTextController;
  String? Function(BuildContext, String?)?
  subscriptionTypeTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  late BuildContext localContext;
  @override
  void initState(BuildContext context) {
    localContext = context;
  }

  @override
  void dispose() {
    subscriptionTypeFocusNode?.dispose();
    subscriptionTypeTextController?.dispose();
  }



  Future<void> saveChanges(String id) async {
    // await Future.delayed(const Duration(seconds: 5));
    FirestoreHandler fh = FirestoreHandler();
    try {
      // DateTime currentDate = DateTime.now();
      // debugPrint("Formatted Date: ${MyDateUtils.formatDate(currentDate)}");
      // debugPrint("Formatted Date: ${MyDateUtils.formatDate(datePicked1!)}");
      // debugPrint("Formatted Date: ${MyDateUtils.formatDate(datePicked2!)}");
      // debugPrint(datePicked1?.toIso8601String());
      String type = subscriptionTypeTextController!.value.text;
      String start = MyDateUtils.formatDate(datePicked1!);
      String end = MyDateUtils.formatDate(datePicked2!);
      Map<String,dynamic> data = {
        "Subscription" : {
          "type" : type,
          "start" : start,
          "end" : end,
        }
      };
      String uid = await Provider.of<VendorsListProvider>(localContext, listen: false).users[id];
      await fh.updateFirestoreData("USERS", uid, data);
      await Provider.of<VendorsListProvider>(localContext, listen: false).updateVendor(uid,id);
      fh.closeConnection();
    } catch(e) {
      fh.closeConnection();
      debugPrint("Exception: $e");
    }
  }
}
