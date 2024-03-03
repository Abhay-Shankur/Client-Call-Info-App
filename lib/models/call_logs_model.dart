import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:call_info/pages/call_logs_widget.dart' show CallLogsWidget;
import 'package:flutter/material.dart';

class CallLogsModel extends FlutterFlowModel<CallLogsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
