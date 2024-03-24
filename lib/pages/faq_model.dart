import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/f_a_q_list_item/f_a_q_list_item_widget.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FAQListItem component.
  late FAQListItemModel fAQListItemModel1;
  // Model for FAQListItem component.
  late FAQListItemModel fAQListItemModel2;
  // Model for FAQListItem component.
  late FAQListItemModel fAQListItemModel3;
  // Model for FAQListItem component.
  late FAQListItemModel fAQListItemModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fAQListItemModel1 = createModel(context, () => FAQListItemModel());
    fAQListItemModel2 = createModel(context, () => FAQListItemModel());
    fAQListItemModel3 = createModel(context, () => FAQListItemModel());
    fAQListItemModel4 = createModel(context, () => FAQListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fAQListItemModel1.dispose();
    fAQListItemModel2.dispose();
    fAQListItemModel3.dispose();
    fAQListItemModel4.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
