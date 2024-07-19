
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/weHelpTo/weHelp_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'we_help_page_widget.dart' show WeHelpPageWidget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeHelpPageModel extends FlutterFlowModel<WeHelpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
      String heading = textController1?.value.text ?? '';
      heading.trim();
      String desc = textController2?.value.text ?? '';
      desc.trim();
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
      if(domain.isNotEmpty) {
        if(domain.isNotEmpty && heading.isNotEmpty && desc.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          Map<String,dynamic> data = {
            'WeHelp' : {
              'heading' : heading,
              'description' : desc
            }
          };
          await firestore.updateFirestoreData("Website", domain, data);
          firestore.closeConnection();
          Provider.of<WebWeHelpProvider>(context, listen: false).updateHeading(heading);
          Provider.of<WebWeHelpProvider>(context, listen: false).updateDescription(desc);
          showToast(context: context, type: ToastificationType.success, title: 'We Help To', desc: 'Information have been saved.');
          return true;
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'We Help To', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'We Help To', desc: 'Please Register domain first.');
      }
      return false;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'We Help To', desc: 'Exception');
      return false;
    }
  }
}
