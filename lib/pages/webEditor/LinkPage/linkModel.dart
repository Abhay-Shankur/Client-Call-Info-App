
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/links/links_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'linkWidget.dart' show LinksPageWidget;
import 'package:flutter/material.dart';

class LinksPageModel extends FlutterFlowModel<LinksPageWidget> {
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  Future<bool> save(BuildContext context) async {
    try {
      String whatsapp = textController1?.value.text ?? '';
      String instagram = textController2?.value.text ?? '';
      String facebook = textController3?.value.text ?? '';
      whatsapp.trim();
      instagram.trim();
      facebook.trim();
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
      if(domain.isNotEmpty) {
        if(whatsapp.isNotEmpty && instagram.isNotEmpty && facebook.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          Links links = Links(whatsappLink: whatsapp, instagramLink: instagram, facebookLink: facebook);
          Map<String, dynamic> data = {
            'Links' : links.toMap()
          };
          await firestore.updateFirestoreData("Website", domain, data);
          Provider.of<WebLinksProvider>(context, listen: false).updateLinks(links);
          firestore.closeConnection();
          showToast(context: context, type: ToastificationType.success, title: 'Links Page', desc: 'Information have been saved.');
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'Links Page', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'Links Page', desc: 'Please Register your Domain.');
      }
      return true;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'Links Page', desc: 'Exception');
      return false;
    }
  }
}
