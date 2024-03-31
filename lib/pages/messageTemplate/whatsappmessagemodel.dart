import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'whatsappmessagetemplate.dart' show WhtstempWidget;
import 'package:flutter/material.dart';

class WhtstempModel extends FlutterFlowModel<WhtstempWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }


/// Action blocks are added here.

/// Additional helper methods are added here.
}
