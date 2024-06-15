import 'package:app/firebaseHandlers/firebase_firestore.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
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
