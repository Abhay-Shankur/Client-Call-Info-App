import 'package:call_info/pages/components/list_view2/list_view2_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'web_testimonial_page_widget.dart' show WebTestimonialPageWidget;
import 'package:flutter/material.dart';

class WebTestimonialPageModel
    extends FlutterFlowModel<WebTestimonialPageWidget> {
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
