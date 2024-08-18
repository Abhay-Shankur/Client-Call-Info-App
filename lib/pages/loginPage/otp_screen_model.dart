import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/main.dart';
import 'package:call_info/util/date_utils.dart';
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

  Future<void> verifyOtp(BuildContext context, {String? nextRoute}) async {
    try {
      String otp = otpController!.value.text;
      debugPrint('OTP: $otp');
      UserCredential? user = await FirebaseAuthHandler(
          context: context
      ).signInWithVerificationCode(otp);
      if(user!=null) {
        // debugPrint('Phone: ${user.user!.phoneNumber?.substring(3)},  UID: ${user.user!.uid}');
        await updateUid(user.user!.uid, user.user!.phoneNumber!.substring(3));
        if(nextRoute != null) {
          navigator.currentState!.pushNamedAndRemoveUntil(nextRoute, (route) => false);
        }
      } else {
        if(context.mounted) {
          toastification.show(
            context: context,
            // title: 'Authentication Failed',
            title: const  Text('Authentication Failed'),
            // description: 'User Credential not found !',
            description: const Text('User Credential not found !'),
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
      }
    } catch (e) {
      debugPrint('Ran into Exception: $e');
    }

  }
/// Additional helper methods are added here.
  Future<void> updateUid(String uid, String phone) async {
    try {
      FirestoreHandler firestoreHandler = FirestoreHandler();
      final value = await firestoreHandler.readFieldAtPath("ADMIN", "Document", phone);
      if(value != uid) {
        Map<String, dynamic> data = {
          phone : uid,
        };
        await firestoreHandler.updateFirestoreData("ADMIN", "USERS", data);
      }
      String? id = FirebaseAuthHandler.getCurrentUser()?.uid;
      if(id != null) {
        final date = await firestoreHandler.readFieldAtPath("USERS", id, "Subscription/created");
        if(date == null) {
          DateTime? creationDate = FirebaseAuthHandler.getCurrentUser()?.metadata.creationTime;
          String created = MyDateUtils.formatDate(creationDate!);
          Map<String,dynamic> data = {
            "Subscription" : {
              "created" : created
            }
          };
          await firestoreHandler.updateFirestoreData("USERS", id, data);
        }
      }
      firestoreHandler.closeConnection();
    } catch(e) {
      debugPrint('Exception: $e');
    }
  }
}
