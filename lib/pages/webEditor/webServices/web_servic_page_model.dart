import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/list_view2/list_view2_widget.dart';
import 'web_servic_page_widget.dart' show WebServicPageWidget;
import 'package:flutter/material.dart';

class WebServicPageModel extends FlutterFlowModel<WebServicPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ListView2 component.
  late ListView2Model listView2Model;

  @override
  void initState(BuildContext context) {
    listView2Model = createModel(context, () => ListView2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listView2Model.dispose();
  }
}
