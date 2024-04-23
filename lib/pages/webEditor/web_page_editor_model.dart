
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/link_design/link_design_widget.dart';
import '/pages/components/web_page_editor_card/web_page_editor_card_widget.dart';
import 'web_page_editor_widget.dart' show WebPageEditorWidget;
import 'package:flutter/material.dart';

class WebPageEditorModel extends FlutterFlowModel<WebPageEditorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LinkDesign component.
  late LinkDesignModel linkDesignModel;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel1;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel2;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel3;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel4;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel5;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel6;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel7;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel8;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel9;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel10;

  @override
  void initState(BuildContext context) {
    linkDesignModel = createModel(context, () => LinkDesignModel());
    webPageEditorCardModel1 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel2 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel3 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel4 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel5 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel6 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel7 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel8 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel9 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel10 =
        createModel(context, () => WebPageEditorCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    linkDesignModel.dispose();
    webPageEditorCardModel1.dispose();
    webPageEditorCardModel2.dispose();
    webPageEditorCardModel3.dispose();
    webPageEditorCardModel4.dispose();
    webPageEditorCardModel5.dispose();
    webPageEditorCardModel6.dispose();
    webPageEditorCardModel7.dispose();
    webPageEditorCardModel8.dispose();
    webPageEditorCardModel9.dispose();
    webPageEditorCardModel10.dispose();
  }
}
