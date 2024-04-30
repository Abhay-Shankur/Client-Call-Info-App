
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/sms/sms_provider.dart';
import 'package:call_info/providers/sms/sms_shared.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:call_info/pages/messageTemplate/sms_template_widget.dart' show SMSTemplateWidget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class SMSTemplateModel extends FlutterFlowModel<SMSTemplateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {

  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<void> saveTemplate(BuildContext context) async {
    try {
      String text = this.textController!.value.text;
      if(text.isEmpty){
        showToast(context: context, type: ToastificationType.info, title: 'SMS Template', desc: 'Please fill the template..');
        return;
      }

      FirestoreHandler firestore = FirestoreHandler();
      Map<String,dynamic> data = {
        'SMS': {
          'text': text,
        }
      };
      String? uid = await FirebaseAuthHandler.getUid() ?? '';
      await firestore.updateFirestoreData("USERS", uid, data);
      firestore.closeConnection();
      SMSMessageTemplate(text: text).saveToShared();
      Provider.of<SMSProvider>(context, listen: false).updateText(text);
      showToast(context: context, type: ToastificationType.success, title: 'SMS Template', desc: 'SMS Template have been saved.');
    } catch (e) {
      debugPrint('Error While saving: $e');
      showToast(context: context, type: ToastificationType.error, title: 'SMS Template', desc: 'SMS Template Exception.');
    }
  }
/// Action blocks are added here.

/// Additional helper methods are added here.
}
