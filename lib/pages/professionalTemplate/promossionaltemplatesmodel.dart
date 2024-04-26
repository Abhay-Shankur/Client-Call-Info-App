// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_choice_chips.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/form_field_controller.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'professionalttemplate.dart' show PromossionalmsgtempWidget;
import 'package:flutter/material.dart';

class PromossionalmsgtempModel
    extends FlutterFlowModel<PromossionalmsgtempWidget> {
  ///  State fields for stateful widgets in this page.
  static  File? pickedFile=null;
  final unfocusNode = FocusNode();
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

/// Action blocks are added here.
  /// Action blocks are added here.
  Future<File?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        pickedFile = File(result.files.single.path!);
        return pickedFile;
      } else {
        // User canceled the picker
        print('No file selected.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
    return null;
  }

  getPickedFile()
  {
    if (pickedFile != null) {
      return pickedFile;
    } else {
      print("Null image");
      // Handle the case where pickedFile is null
    }
  }

/// Additional helper methods are added here.
}
