
import '/pages/components/webServiceComponent/web_service_component_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'webServicesWidget.dart' show WeServicesPageWidget;
import 'package:flutter/material.dart';

class WeServicesPageModel extends FlutterFlowModel<WeServicesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webServiceComponent component.
  late WebServiceComponentModel webServiceComponentModel;

  @override
  void initState(BuildContext context) {
    webServiceComponentModel =
        createModel(context, () => WebServiceComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webServiceComponentModel.dispose();
  }
}
