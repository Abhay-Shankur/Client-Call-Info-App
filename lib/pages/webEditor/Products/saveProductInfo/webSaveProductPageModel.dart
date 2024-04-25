import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'webSaveProductPageWidget.dart' show WebSaveProductWidget;
import 'package:flutter/material.dart';

class WebSaveProductModel extends FlutterFlowModel<WebSaveProductWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode1;
  TextEditingController? productNameTextController1;
  String? Function(BuildContext, String?)? productNameTextController1Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameTextController2;
  String? Function(BuildContext, String?)? productNameTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    productNameFocusNode1?.dispose();
    productNameTextController1?.dispose();

    productNameFocusNode2?.dispose();
    productNameTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
