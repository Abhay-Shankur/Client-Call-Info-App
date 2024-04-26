import 'package:call_info/pages/components/image_list_tile/image_list_tile_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'image_list_view_widget.dart' show ImageListViewWidget;
import 'package:flutter/material.dart';

class ImageListViewModel extends FlutterFlowModel<ImageListViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ImageListTile dynamic component.
  late FlutterFlowDynamicModels<ImageListTileModel> imageListTileModels;

  @override
  void initState(BuildContext context) {
    imageListTileModels = FlutterFlowDynamicModels(() => ImageListTileModel());
  }

  @override
  void dispose() {
    imageListTileModels.dispose();
  }
}
