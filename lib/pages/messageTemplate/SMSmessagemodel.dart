
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/sms/sms_shared.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:call_info/pages/messageTemplate/SMSmessagetemplate.dart' show SMSTemplateWidget;
import 'package:flutter/material.dart';

class WhtstempCopyModel extends FlutterFlowModel<SMSTemplateWidget> {
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

  Future<void> saveTemplate() async {
    String text = this.textController!.value.text;
    // Update message template text
    // SharedPreferencesHelper.setString('smsMsg', text);
    FirestoreHandler firestore =FirestoreHandler();
    Map<String,dynamic> data = {
      'sms': {
        'text': text,
      }
    };
    await firestore.updateFirestoreData("USERS","abhay",data);
    firestore.closeConnection();
    SMSMessageTemplate(text: text).saveToShared();
    debugPrint('Saving Template');
  }
/// Action blocks are added here.

/// Additional helper methods are added here.
}
