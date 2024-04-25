import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'link_design_widget.dart' show LinkDesignWidget;
import 'package:flutter/material.dart';

class LinkDesignModel extends FlutterFlowModel<LinkDesignWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  saveDomain() async {

  }
}
