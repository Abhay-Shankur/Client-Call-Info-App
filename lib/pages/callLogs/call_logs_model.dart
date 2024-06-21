
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/call_log/call_log_widget.dart';
import 'package:flutter/material.dart';
import 'call_logs_widget.dart';
import '../components/call_log/call_log_model.dart';
class CalllogsModel extends FlutterFlowModel<CallLogsPage> {
  ///  State fields for stateful widgets in this page.
  // late Iterable<CallLogEntry> _callLogs;

  final unfocusNode = FocusNode();
  late String callername;
  late int  callernumber;
  late String callercallType;

  // Model for CallLog component.
  late CallLogModel callLogModel1;
  // Model for CallLog component.
  late CallLogModel callLogModel2;
  // Model for CallLog component.
  late CallLogModel callLogModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {

    callLogModel1 = createModel(context, () => CallLogModel());
    callLogModel2 = createModel(context, () => CallLogModel());
    callLogModel3 = createModel(context, () => CallLogModel());

  }

  @override
  void dispose() {
    unfocusNode.dispose();
    callLogModel1.dispose();
    callLogModel2.dispose();
    callLogModel3.dispose();
  }

/// Action blocks are added here.
//   Future<void> _retrieveCallLogs() async {
//     // Retrieve call logs
//     _callLogs = await CallLog.get();
//     final callLog = _callLogs.elementAt(1);
//     // Update the UI after retrieving call logs
//   }


/// Additional helper methods are added here.
}


