import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/main.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberController;
  String? Function(BuildContext, String?)? mobileNumberControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    mobileNumberFocusNode?.dispose();
    mobileNumberController?.dispose();
  }

/// Action blocks are added here.
  Future<void> sendOtp(BuildContext context) async{
    String phoneNumber = mobileNumberController!.value.text;
    debugPrint('Mobile Number: $phoneNumber');
    await FirebaseAuthHandler(
        context: context
    ).signInWithPhoneNumber(phoneNumber, () {
      navigator.currentState!.pushReplacementNamed(RouteKeys.vendorOtp);
    });
  }

/// Additional helper methods are added here.
  Future<bool> checkPhone() async {
    String phoneNumber = mobileNumberController!.value.text;
    try {
      FirestoreHandler firestoreHandler = FirestoreHandler();
      Map<String, dynamic> data = await firestoreHandler.readFirestoreData("ADMIN", "USERS");
      firestoreHandler.closeConnection();
      if(data.isNotEmpty && data.containsKey(phoneNumber)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Exception: $e');
    }
    return false;
  }
}
