
import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  File? pickedFile;

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
        debugPrint('No file selected.');
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
    return null;
  }

  getPickedFile()
  {
    if (pickedFile != null) {
      return pickedFile;
    } else {
      debugPrint("Null image");
      // Handle the case where pickedFile is null
    }
  }

  Future<void> saveProfile(BuildContext context) async{
    // _profileProvider!.updateProfile(newProfile);
    try{
      String uid = FirebaseAuthHandler.getUid() ?? '';
      if(uid.isNotEmpty) {
        FirestoreHandler firestore = FirestoreHandler();
        Profile profile = Profile(
          vendorName: textController1!.value.text,
          vendorEmail: textController2!.value.text,
          vendorContact: textController3!.value.text,
          businessName: textController4!.value.text,
          businessDescription: textController5!.value.text
        );
        if(pickedFile != null) {
          String image = await FirebaseStorageService.uploadImage(pickedFile!, 'Users/$uid/', 'profile') ?? '';
          profile.imageFile = image;
        }
        Map<String,dynamic> data = {
          'Profile' : profile.toMap()
        };
        await firestore.updateFirestoreData("USERS", uid, data);
        if(context.mounted) {
          Provider.of<ProfileProvider>(context, listen: false).updateProfile(profile);
          showToast(context: context, type: ToastificationType.success, title: 'Profile', desc: 'Profile Updated');
        }
        firestore.closeConnection();
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'Profile', desc: 'User Not Authenticated');
      }
    } catch (e) {
      debugPrint('Exception: $e');
      if(context.mounted) {
        showToast(context: context, type: ToastificationType.error, title: 'Profile', desc: 'Exception occurred');
      }
    }
  }
/// Additional helper methods are added here.
}
