import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/metadata/metadata_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'web_metadata_widget.dart' show WebMetadataPageWidget;
import 'package:flutter/material.dart';

class WebMetadataPageModel extends FlutterFlowModel<WebMetadataPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;

  File? pickedFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();
  }

  Future<bool> saveInfo(BuildContext context) async {
    try {
      // await Future.delayed(Duration(seconds: 5), ()=> debugPrint("object"));
      WebMetaDataProvider provider = Provider.of<WebMetaDataProvider>(context, listen: false);
      provider.updateOwnerName(textController1!.value.text);
      provider.updateOwnerContact(textController2!.value.text);
      provider.updateBusinessName(textController3!.value.text);
      provider.updateBusinessContact(textController4!.value.text);
      provider.updateBusinessMail(textController5!.value.text);
      provider.updateBusinessAddress(textController6!.value.text);
      provider.updateBusinessDescription(textController7!.value.text);

      Map<String, dynamic> data ={
        'MasterData' : {
          'ownerName' : textController1!.value.text,
          'ownerContact' : textController2!.value.text,
          'businessName' : textController3!.value.text,
          'businessContact' : textController4!.value.text,
          'businessMail' : textController5!.value.text,
          'businessAddress' : textController6!.value.text,
          'businessDescription' : textController7!.value.text,
        },
      };

      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;

      if(pickedFile != null) {
        String imageUrl = await FirebaseStorageService.uploadImage(pickedFile!, '$domain/', 'banner') ?? '';
        data['MasterData']['imageBanner'] = imageUrl;
        provider.updateImageBanner(imageUrl);
      }

      debugPrint('Data: ${data.toString()}');
      FirestoreHandler firestoreHandler = FirestoreHandler();
      await firestoreHandler.updateFirestoreData("Website", domain, data);
      firestoreHandler.closeConnection();
      showToast(context: context, type: ToastificationType.success, title: 'Master Data', desc: 'Information have been saved.');
      return true;
    } catch (e) {
      debugPrint('Exception...');
      showToast(context: context, type: ToastificationType.error, title: 'Master Data', desc: 'Failed to save information!');
      return false;
    }
  }

  Future<File?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        pickedFile = File(result.files.single.path!);
        return pickedFile;
      } else {
        // User canceled the picker
        debugPrint('No file selected.');
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
    return null;
  }
}
