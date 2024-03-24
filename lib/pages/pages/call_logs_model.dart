import 'package:call_info/handlers/callLogs_service.dart';
import 'package:call_info/handlers/service_locator.dart';
import 'package:call_log/call_log.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/pages/components/call_log_list_item/call_log_list_item_widget.dart';
import 'call_logs_widget.dart' show CallLogsWidget;
import 'package:flutter/material.dart';

class CallLogsModel extends FlutterFlowModel<CallLogsWidget> {
  ///  State fields for stateful widgets in this page.
  late Iterable<CallLogEntry> _callLogs;
  CallLogService _callLogService = getIt<CallLogService>();

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
  Future loadLogs() async {
    _callLogs = await _callLogService.getCallLogs();
    // notifyListeners();
  }
/// Additional helper methods are added here.
}
