
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/services/services_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'web_service_add_widget.dart' show WebServiceAddWidget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebServiceAddModel extends FlutterFlowModel<WebServiceAddWidget> {
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
          // int count=Provider.of<WebServicesProvider>(context, listen: false).list.length;
          Map<String,dynamic> data = {
            'heading' : heading,
            'description' : desc
          };
          await firestore.pushToArray("Website", domain, "Services", data);
          firestore.closeConnection();
          WebServices services = WebServices.fromMap(data);
          Provider.of<WebServicesProvider>(context, listen: false).updateList(services);
          showToast(context: context, type: ToastificationType.success, title: 'WebServices', desc: 'Information have been saved.');
          return true;
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'WebServices', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'WebServices', desc: 'Please Register domain first.');
      }
      return false;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'WebServices', desc: 'Exception');
      return false;
    }
  }

}
