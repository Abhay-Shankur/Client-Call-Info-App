import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for Slider widget.
  double? sliderValue;
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

  Future<bool> save(BuildContext context) async {
    try {
      String authKey = textController1!.value.text ?? '';
      String instanceId = textController2!.value.text ?? '';
      String uid = FirebaseAuthHandler.getUid() ?? '';
      if(uid.isNotEmpty && authKey.isNotEmpty && instanceId.isNotEmpty) {
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic> data = {
          'Whatsapp' :{
            'AUTH_KEY': authKey,
            'instance_id': instanceId
          }

        };
        await firestore.updateFirestoreData("USERS", uid, data);
        Provider.of<WPProvider>(context, listen: false).updateAccessToken(authKey);
        Provider.of<WPProvider>(context, listen: false).updateInstanceId(instanceId);
        await SharedPreferencesHelper.setString('AUTH_KEY', authKey);
        await SharedPreferencesHelper.setString('instance_id', instanceId);
        firestore.closeConnection();
        showToast(context: context, type: ToastificationType.success, title: 'Subscription Page', desc: 'Information have been saved.');
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'Subscription Page', desc: 'Failed to Update.');
      }
      return true;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'Subscription Page', desc: 'Exception');
      return false;
    }
  }

}
