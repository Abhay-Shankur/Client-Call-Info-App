import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for otp widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpTextController;
  String? Function(BuildContext, String?)? otpTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    otpFocusNode?.dispose();
    otpTextController?.dispose();
  }

  Future<bool> checkAdmin(String number) async {
    try {
      FirestoreHandler firestoreHandler = FirestoreHandler();
      var doc = await firestoreHandler.readFirestoreData("ADMIN", "ADMINS");
      firestoreHandler.closeConnection();
      return doc.keys.contains(number);
    }catch (e) {
      debugPrint("Exception $this: $e");
      return false;
    }
  }

  
}
