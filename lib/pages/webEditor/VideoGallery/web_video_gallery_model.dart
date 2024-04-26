import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/list_view/list_view_widget.dart';
import 'web_video_gallery_widget.dart' show WebVideoGalleryWidget;
import 'package:flutter/material.dart';

class WebVideoGalleryModel extends FlutterFlowModel<WebVideoGalleryWidget> {
  ///  State fields for stateful widgets in this page.

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
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    listViewModel.dispose();
  }
}
