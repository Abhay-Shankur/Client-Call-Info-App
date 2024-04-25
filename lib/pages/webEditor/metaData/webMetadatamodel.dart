import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/metadata/metadata_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'webMetadatawidget.dart' show WebMetadataPageWidget;
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
  }

  Future<bool> saveInfo(BuildContext context) async {
    try {
      // await Future.delayed(Duration(seconds: 5), ()=> print("object"));
      MetaDataProvider provider = Provider.of<MetaDataProvider>(context, listen: false);
      provider.updateOwnerName(textController1!.value.text);
      provider.updateOwnerContact(textController2!.value.text);
      provider.updateBusinessName(textController3!.value.text);
      provider.updateBusinessContact(textController4!.value.text);
      provider.updateBusinessMail(textController5!.value.text);
      provider.updateBusinessAddress(textController6!.value.text);

      Map<String, dynamic> data ={
        'MasterData' : {
          'ownerName' : textController1!.value.text,
          'ownerContact' : textController2!.value.text,
          'businessName' : textController3!.value.text,
          'businessContact' : textController4!.value.text,
          'businessMail' : textController5!.value.text,
          'businessAddress' : textController6!.value.text,
        },
      };
      debugPrint('Data: ${data.toString()}');
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
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

  showToasti({required BuildContext context, required bool res}){
    if(res) {
      return toastification.show(
        context: context,
        type: ToastificationType.success,
        style: ToastificationStyle.minimal,
        autoCloseDuration: const Duration(seconds: 5),
        title: 'Metadata',
        // you can also use RichText widget for title and description parameters
        description: 'Information have been saved.',
        alignment: Alignment.bottomLeft,
        animationDuration: const Duration(milliseconds: 300),
        animationBuilder: (context, animation, alignment, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        icon: const Icon(Icons.check),
        primaryColor: Colors.green,
        backgroundColor: Colors.green.shade50,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 16,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
        showProgressBar: true,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: false,
        pauseOnHover: true,
        dragToClose: true,
      );
    } else {
      return toastification.show(
        context: context,
        type: ToastificationType.warning,
        style: ToastificationStyle.minimal,
        autoCloseDuration: const Duration(seconds: 5),
        title: 'Metadata',
        // you can also use RichText widget for title and description parameters
        description: 'Failed to save information!',
        alignment: Alignment.bottomLeft,
        animationDuration: const Duration(milliseconds: 300),
        animationBuilder: (context, animation, alignment, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        icon: const Icon(Icons.check),
        primaryColor: Colors.red,
        backgroundColor: Color.fromARGB(255, 255, 110, 110),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 16,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
        showProgressBar: true,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: false,
        pauseOnHover: true,
        dragToClose: true,
      );
    }

  }

}
