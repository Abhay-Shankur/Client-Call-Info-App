import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/pages/components/call_log_list_item/call_log_list_item_widget.dart';
import 'call_logs_widget.dart' show CallLogsWidget;
import 'package:flutter/material.dart';

class CallLogsModel extends FlutterFlowModel<CallLogsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CallLogListItem component.
  late CallLogListItemModel callLogListItemModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    callLogListItemModel = createModel(context, () => CallLogListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    callLogListItemModel.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
