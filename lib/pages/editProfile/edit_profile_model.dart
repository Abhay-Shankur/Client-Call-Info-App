
import 'dart:io';

import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  static  File? pickedFile=null;

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

  /// Initialization and disposal methods.
  // ProfileProvider _profileProvider = ProfileProvider();
  // ProfileProvider? provider;

  @override
  void initState(BuildContext context) {
    // _profileProvider = Provider.of<ProfileProvider>(context);
    // // Access profile data
    // Profile? profile = _profileProvider?.profile;
    // // Set text controller value if profile is not null and not empty
    // if (profile != null && profile.vendorName!.isNotEmpty) {
    //   textController1.text = profile.vendorName!;
    //   debugPrint('In IF');
    // } else {
    //   debugPrint('In else');
    // }
  }



  @override
  void dispose() {
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
  }


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

  saveProfile() {
    Profile newProfile = Profile(
        imageFile: getPickedFile(),
        vendorName: textController1!.value.text,
        vendorEmail: textController2!.value.text,
        vendorContact: textController3!.value.text,
        businessName: textController4!.value.text,
        businessDescription: textController5!.value.text
    );
    // _profileProvider!.updateProfile(newProfile);

  }
/// Additional helper methods are added here.
}
