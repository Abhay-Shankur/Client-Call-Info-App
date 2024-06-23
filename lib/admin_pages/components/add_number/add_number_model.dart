import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'add_number_widget.dart' show AddNumberWidget;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNumberModel extends FlutterFlowModel<AddNumberWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }

  Future<void> addVendor() async {
    try {
      String phone = phoneNumberTextController!.value.text;

      FirestoreHandler firestoreHandler = FirestoreHandler();
      final value = await firestoreHandler.readFieldAtPath("ADMIN", "USERS", phone);
      if(value == null) {
        Map<String,dynamic> data = {
          phone : null,
        };
        await firestoreHandler.updateFirestoreData("ADMIN", "USERS", data);
        debugPrint('Value Updated');
        Get.showSnackbar(const GetSnackBar(message: "Vendor Added Successfully"));
      }
      firestoreHandler.closeConnection();
    } catch (e) {
      debugPrint('Exception: $e}');
    }
  }
}
