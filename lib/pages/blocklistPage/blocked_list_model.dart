import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'blocked_list_widget.dart' show BlockedListWidget;
import 'package:flutter/material.dart';

class BlockedListModel extends FlutterFlowModel<BlockedListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
