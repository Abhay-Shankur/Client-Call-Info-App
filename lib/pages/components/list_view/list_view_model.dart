import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/list_tile/list_tile_widget.dart';
import 'list_view_widget.dart' show ListViewWidget;
import 'package:flutter/material.dart';

class ListViewModel extends FlutterFlowModel<ListViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ListTile dynamic component.
  late FlutterFlowDynamicModels<ListTileModel> listTileModels;

  @override
  void initState(BuildContext context) {
    listTileModels = FlutterFlowDynamicModels(() => ListTileModel());
  }

  @override
  void dispose() {
    listTileModels.dispose();
  }
}
