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

/// Additional helper methods are added here.
}
