import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'whatsappmessagetemplate.dart' show WhatsappTemplateWidget;
import 'package:flutter/material.dart';

class WhtstempModel extends FlutterFlowModel<WhatsappTemplateWidget> {
  ///  State fields for stateful widgets in this page.
  late BuildContext _context;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  static late File? pickedFile;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    _context = context;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }


/// Action blocks are added here.

/// Additional helper methods are added here.
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

  saveTemplate() async {
    // Upload the picked file
    try {
      String textData = textController!.value.text;
      String? imageUrl = await FirebaseStorageService.uploadImage(pickedFile!, 'WhatsApp Images/');
      if (imageUrl != null) {
        print('Image uploaded. URL: $imageUrl');
        FirestoreHandler firestore = FirestoreHandler();
        Map<String, dynamic> data = {
          'whatsapp': {
            'text': textData,
            'imageUrl': imageUrl,
          }
        };
        String? uid = await FirebaseAuthHandler.getUid();
        await firestore.updateFirestoreData("USERS", uid ?? 'dummy', data);
        firestore.closeConnection();
        WPMessageTemplate(text: textData, image: imageUrl).saveToShared();
      } else {
        print('Image upload failed.');
      }
    } catch (e) {
      debugPrint('Error While saving: $e');
    }
  }

  void showToast() {
    String text = textController.text;
    Fluttertoast.showToast(
      msg: text.isNotEmpty ? text : 'Text field is empty',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  // showToast() {
  //   return toastification.show(
  //     context: _context,
  //     type: ToastificationType.success,
  //     style: ToastificationStyle.flat,
  //     autoCloseDuration: const Duration(seconds: 5),
  //     title: Text('Hello, World!'),
  //     // you can also use RichText widget for title and description parameters
  //     description: RichText(text: const TextSpan(text: 'This is a sample toast message. ')),
  //     alignment: Alignment.topRight,
  //     direction: TextDirection.ltr,
  //     animationDuration: const Duration(milliseconds: 300),
  //     animationBuilder: (context, animation, alignment, child) {
  //       return FadeTransition(
  //         turns: animation,
  //         child: child,
  //       );
  //     },
  //     icon: const Icon(Icons.check),
  //     primaryColor: Colors.green,
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.black,
  //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  //     margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //     borderRadius: BorderRadius.circular(12),
  //     boxShadow: const [
  //       BoxShadow(
  //         color: Color(0x07000000),
  //         blurRadius: 16,
  //         offset: Offset(0, 16),
  //         spreadRadius: 0,
  //       )
  //     ],
  //     showProgressBar: true,
  //     closeButtonShowType: CloseButtonShowType.onHover,
  //     closeOnClick: false,
  //     pauseOnHover: true,
  //     dragToClose: true,
  //     applyBlurEffect: true,
  //     callbacks: ToastificationCallbacks(
  //       onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
  //       onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
  //       onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
  //       onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
  //     ),
  //   );
  // }
}
