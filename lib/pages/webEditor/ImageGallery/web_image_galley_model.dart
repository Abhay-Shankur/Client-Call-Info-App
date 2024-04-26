import 'package:call_info/pages/components/list_view/list_view_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'web_image_galley_widget.dart' show WebImageGalleyWidget;
import 'package:flutter/material.dart';

class WebImageGalleyModel extends FlutterFlowModel<WebImageGalleyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Model for ListView component.
  late ListViewModel listViewModel;

  @override
  void initState(BuildContext context) {
    listViewModel = createModel(context, () => ListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    listViewModel.dispose();
  }
}
