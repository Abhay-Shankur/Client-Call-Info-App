import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'vendor_list_widget.dart' show VendorListWidget;
import 'package:flutter/material.dart';

class VendorListModel extends FlutterFlowModel<VendorListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<List<String>> getVendors() async {
    FirestoreHandler firestoreHandler = FirestoreHandler();
    try {
      List<String> list = await firestoreHandler.getDocumentNames("USERS") ?? [];
      firestoreHandler.closeConnection();
      return list;
    } catch (e) {
      debugPrint('Exception: $e');
      firestoreHandler.closeConnection();
    }
    return [];
  }



}
