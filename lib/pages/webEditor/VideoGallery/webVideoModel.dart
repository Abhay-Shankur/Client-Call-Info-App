import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'webVideoGallery.dart' show WebVideoGalleryWidget;
import 'package:flutter/material.dart';

class WebVideoGalleryModel extends FlutterFlowModel<WebVideoGalleryWidget>{
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
