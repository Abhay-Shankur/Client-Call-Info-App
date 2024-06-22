import 'package:call_info/pages/components/image_list_view/image_list_view_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'web_product_page_widget.dart' show WebProductsPageWidget;
import 'package:flutter/material.dart';

class WebAddProductPageModel extends FlutterFlowModel<WebProductsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ListView component.
  late ImageListViewModel imageListViewModel;

  @override
  void initState(BuildContext context) {
    imageListViewModel = createModel(context, () => ImageListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    imageListViewModel.dispose();
  }
}
