import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
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

  Future<void> verifyOtp(BuildContext context) async {
    try {
      String otp = otpController!.value.text;
      debugPrint('OTP: $otp');
      UserCredential? user = await FirebaseAuthHandler(
          context: context
      ).signInWithVerificationCode(otp);
      if(user!=null) {
        navigator.currentState!.pushNamedAndRemoveUntil(routeKeys.vendorDashboard, (route) => false);
      } else {
        toastification.show(
            context: navigator.currentState!.context,
            title: 'Authentication Failed',
            description: 'User Credential not found !',
            type: ToastificationType.warning,
            style: ToastificationStyle.minimal,
            alignment: Alignment.bottomLeft,
            animationDuration: const Duration(milliseconds: 300),
            animationBuilder: (context, animation, alignment, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
            },
            autoCloseDuration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      debugPrint('Ran into Exception: $e');
    }

  }
/// Additional helper methods are added here.
}
