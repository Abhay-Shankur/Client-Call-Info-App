import '../components/grid/grid_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dashboard_widget.dart' show DashborddemoWidget;
import 'package:flutter/material.dart';

class DashborddemoCopyCopyModel
    extends FlutterFlowModel<DashborddemoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for grid component.
  late GridModel gridModel1;
  // Model for grid component.
  late GridModel gridModel2;
  // Model for grid component.
  late GridModel gridModel3;
  // Model for grid component.
  late GridModel gridModel4;

  @override
  void initState(BuildContext context) {
    gridModel1 = createModel(context, () => GridModel());
    gridModel2 = createModel(context, () => GridModel());
    gridModel3 = createModel(context, () => GridModel());
    gridModel4 = createModel(context, () => GridModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gridModel1.dispose();
    gridModel2.dispose();
    gridModel3.dispose();
    gridModel4.dispose();
  }
}
