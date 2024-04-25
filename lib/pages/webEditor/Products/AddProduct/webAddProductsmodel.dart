import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'webAddProductsWidget.dart' show WebAddProductPageWidget;
import 'package:flutter/material.dart';

class WebAddProductPageModel extends FlutterFlowModel<WebAddProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
