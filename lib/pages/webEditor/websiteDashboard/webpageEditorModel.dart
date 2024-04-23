import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'webPageEditorDashboard.dart' show webPageEditor;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class webPageModel extends FlutterFlowModel<webPageEditor> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
