import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/weHelpTo/wehelp_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'we_help_page_widget.dart' show WeHelpPageWidget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeHelpPageModel extends FlutterFlowModel<WeHelpPageWidget> {
  ///  State fields for stateful widgets in this page.
  File? pickedFile1;
  File? pickedFile2;
  File? pickedFile3;

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

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

  Future<File?> pickFile(int i) async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        switch(i){
          case 1:
            pickedFile1 = File(result.files.single.path!);
            return pickedFile1;
          case 2:
            pickedFile2 = File(result.files.single.path!);
            return pickedFile2;
          case 3:
            pickedFile3 = File(result.files.single.path!);
            return pickedFile3;
        }
      } else {
        // User canceled the picker
        debugPrint('No file selected.');
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
    return null;
  }

  Future<bool> save(BuildContext context) async {
    try {
      String heading = textController1?.value.text ?? '';
      heading.trim();
      String desc = textController2?.value.text ?? '';
      desc.trim();
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
      if(domain.isNotEmpty) {
        if((pickedFile1 != null) && (pickedFile2 != null) && (pickedFile3 != null) && domain.isNotEmpty && heading.isNotEmpty && desc.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          String image1 = await FirebaseStorageService.uploadImage(pickedFile1!, "$domain/", "WeHelp1") ?? '';
          String image2 = await FirebaseStorageService.uploadImage(pickedFile2!, "$domain/", "WeHelp2") ?? '';
          String image3 = await FirebaseStorageService.uploadImage(pickedFile3!, "$domain/", "WeHelp3") ?? '';
          Map<String,dynamic> data = {
            'WeHelp' : {
              'image1' : image1,
              'image2' : image2,
              'image3' : image3,
              'heading' : heading,
              'description' : desc
            }
          };
          await firestore.updateFirestoreData("Website", domain, data);
          firestore.closeConnection();
          Provider.of<WebWeHelpProvider>(context, listen: false).updateImage1(image1);
          Provider.of<WebWeHelpProvider>(context, listen: false).updateImage2(image2);
          Provider.of<WebWeHelpProvider>(context, listen: false).updateImage3(image3);
          Provider.of<WebWeHelpProvider>(context, listen: false).updateHeading(heading);
          Provider.of<WebWeHelpProvider>(context, listen: false).updateDescription(desc);
          showToast(context: context, type: ToastificationType.success, title: 'We Help To', desc: 'Information have been saved.');
          return true;
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'We Help To', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'We Help To', desc: 'Please Register domain first.');
      }
      return false;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'We Help To', desc: 'Exception');
      return false;
    }
  }
}
