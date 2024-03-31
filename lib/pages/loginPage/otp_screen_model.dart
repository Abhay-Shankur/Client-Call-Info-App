import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'otp_screen_widget.dart' show OTPScreenWidget;
import 'package:flutter/material.dart';

class OTPScreenModel extends FlutterFlowModel<OTPScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for OTP widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpController;
  String? Function(BuildContext, String?)? otpControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    otpFocusNode?.dispose();
    otpController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
