import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'whatsapp_template_widget.dart' show WhatsappTemplateWidget;
import 'package:flutter/material.dart';

class WhatsappTemplateModel extends FlutterFlowModel<WhatsappTemplateWidget> {
  ///  State fields for stateful widgets in this page.
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  File? pickedFile;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {

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
        debugPrint('No file selected.');
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
    return null;
  }

  Future<void> saveTemplate(BuildContext context) async {
    // Upload the picked file
    try {
      String textData = textController!.value.text;
      if(textData.isEmpty || pickedFile == null){
        showToast(context: context, type: ToastificationType.info, title: 'Whatsapp Template', desc: 'Please fill the template..');
        return;
      }

      String uid = FirebaseAuthHandler.getUid() ?? '';
      if(uid.isNotEmpty) {
        // String? imageUrl = await FirebaseStorageService.uploadImage(pickedFile!, 'Users/$uid/WhatsApp Images/');
        String imageUrl = await FirebaseStorageService.uploadImage(pickedFile!, 'Users/$uid/WhatsApp Images/', 'WhatsappImage') ?? '';
        if (imageUrl.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          Map<String, dynamic> data = {
            'Whatsapp': {
              'text': textData,
              'image': imageUrl,
            }
          };
          await firestore.updateFirestoreData("USERS", uid, data);
          firestore.closeConnection();
          WPMessageTemplate(text: textData, image: imageUrl).saveToShared();
          Provider.of<WPProvider>(context, listen: false).updateText(textData);
          Provider.of<WPProvider>(context, listen: false).updateImage(imageUrl);
          showToast(context: context, type: ToastificationType.success, title: 'Whatsapp Template', desc: 'Whatsapp Template have been saved.');
        } else {
          debugPrint('Image upload failed.');
          showToast(context: context, type: ToastificationType.warning, title: 'Whatsapp Template', desc: 'Please Try Again Later !.');
        }
      }
    } catch (e) {
      debugPrint('Error While saving: $e');
      showToast(context: context, type: ToastificationType.error, title: 'Whatsapp Template', desc: 'Whatsapp Template Exception.');
    }
  }

  // void showToast() {
  //   String text = textController.text;
  //   Fluttertoast.showToast(
  //     msg: text.isNotEmpty ? text : 'Text field is empty',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //   );
  // }

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
  //       onTap: (toastItem) => debugPrint('Toast ${toastItem.id} tapped'),
  //       onCloseButtonTap: (toastItem) => debugPrint('Toast ${toastItem.id} close button tapped'),
  //       onAutoCompleteCompleted: (toastItem) => debugPrint('Toast ${toastItem.id} auto complete completed'),
  //       onDismissed: (toastItem) => debugPrint('Toast ${toastItem.id} dismissed'),
  //     ),
  //   );
  // }
}
