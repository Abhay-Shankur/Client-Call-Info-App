import 'package:call_info/pages/components/ListView/list_view_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'web_add_product_page_widget.dart' show WebAddProductPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebAddProductPageModel extends FlutterFlowModel<WebAddProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ListView component.
  late ListViewModel listViewModel;

  @override
  void initState(BuildContext context) {
    listViewModel = createModel(context, () => ListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewModel.dispose();
  }
}
