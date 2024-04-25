import 'package:call_info/firebaseHandlers/firebase_auth.dart';
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
  sendOtp() async{
    String phoneNumber = mobileNumberController!.value.text;
    debugPrint('Mobile Number: $phoneNumber');
    await FirebaseAuthHandler(
        context: navigator.currentState!.context
    ).signInWithPhoneNumber(phoneNumber, () {
      navigator.currentState!.pushReplacementNamed(routeKeys.vendorOtp);
    });
  }
/// Additional helper methods are added here.
}
