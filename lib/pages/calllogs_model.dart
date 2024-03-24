import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/call_log/call_log_widget.dart';
import 'calllogs_widget.dart' show CalllogsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/call_log/call_log_model.dart';

class CalllogsModel extends FlutterFlowModel<CalllogsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

/// Additional helper methods are added here.
}
