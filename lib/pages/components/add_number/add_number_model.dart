import 'package:call_info/providers/blocklist/blocklist_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'add_number_widget.dart' show AddNumberWidget;
import 'package:flutter/material.dart';

class AddNumberModel extends FlutterFlowModel<AddNumberWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }

  void addNumber(BuildContext context) {
    try {
      String val = phoneNumberTextController!.value.text;
      Provider.of<BlocklistProvider>(context, listen: false).addItem("+91$val");
    } catch(e) {
      debugPrint("Exception: $e");
    }
  }

}
