import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'vendorSubscriptionWidget.dart' show ActiveSubscriptionWidget;
import 'package:flutter/material.dart';
import 'package:call_info/main.dart';

class ActiveSubscriptionModel extends FlutterFlowModel<ActiveSubscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  Future<void> save() async {
    try {
      String accessToken = textController1!.value.text;
      String instanceId = textController2!.value.text;

      if(accessToken.isEmpty || instanceId.isEmpty) throw Exception('Empty AccessToken or  InstanceID');
      FirestoreHandler firestore = FirestoreHandler();
      Map<String, dynamic> data = {
        "WhatsAppAuth" : {
          "AUTH_KEY" : accessToken,
          "instance_id" : instanceId,
        }
      };
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        await firestore.updateFirestoreData("USERS", uid, data);
        SharedPreferencesHelper.setString("AUTH_KEY", accessToken);
        SharedPreferencesHelper.setString("instance_id", instanceId);
      }
      firestore.closeConnection();

    } catch (e) {
      debugPrint('Error: $e');
      toastification.show(
        context: navigator.currentState!.context,
        title: 'Failed',
        description: 'Ohh Something is wrong!',
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
}
