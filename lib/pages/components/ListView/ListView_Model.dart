import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'ListView.Widet.dart' show ListViewWidget;
import 'package:flutter/material.dart';
import '/pages/components/ListTile/list_Tile_model.dart';

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
