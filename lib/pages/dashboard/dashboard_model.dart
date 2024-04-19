import '/pages/components/card_call/card_call_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for card_call component.
  late CardCallModel cardCallModel1;
  // Model for card_call component.
  late CardCallModel cardCallModel2;
  // Model for card_call component.
  late CardCallModel cardCallModel3;
  // Model for card_call component.
  late CardCallModel cardCallModel4;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    cardCallModel1 = createModel(context, () => CardCallModel());
    cardCallModel2 = createModel(context, () => CardCallModel());
    cardCallModel3 = createModel(context, () => CardCallModel());
    cardCallModel4 = createModel(context, () => CardCallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardCallModel1.dispose();
    cardCallModel2.dispose();
    cardCallModel3.dispose();
    cardCallModel4.dispose();
  }
}

