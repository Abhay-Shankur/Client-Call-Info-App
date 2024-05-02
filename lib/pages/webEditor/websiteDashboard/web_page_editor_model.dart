
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import '/pages/components/link_design/link_design_widget.dart';
import '/pages/components/web_page_editor_card/web_page_editor_card_widget.dart';
import 'web_page_editor_widget.dart' show WebPageEditorWidget;
import 'package:flutter/material.dart';

class WebPageEditorModel extends FlutterFlowModel<WebPageEditorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LinkDesign component.
  late LinkDesignModel linkDesignModel;

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel1;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel2;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel3;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel4;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel5;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel6;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel7;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel8;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel9;
  // Model for webPageEditorCard component.
  late WebPageEditorCardModel webPageEditorCardModel10;

  @override
  void initState(BuildContext context) {
    linkDesignModel = createModel(context, () => LinkDesignModel());
    webPageEditorCardModel1 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel2 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel3 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel4 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel5 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel6 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel7 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel8 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel9 =
        createModel(context, () => WebPageEditorCardModel());
    webPageEditorCardModel10 =
        createModel(context, () => WebPageEditorCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    linkDesignModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
    webPageEditorCardModel1.dispose();
    webPageEditorCardModel2.dispose();
    webPageEditorCardModel3.dispose();
    webPageEditorCardModel4.dispose();
    webPageEditorCardModel5.dispose();
    webPageEditorCardModel6.dispose();
    webPageEditorCardModel7.dispose();
    webPageEditorCardModel8.dispose();
    webPageEditorCardModel9.dispose();
    webPageEditorCardModel10.dispose();
  }

  saveDomain(BuildContext context) async {
    try{
      Map<String,dynamic> data = {
        'webDomain' : '${textController!.value.text}',
      };

      FirestoreHandler firestore = FirestoreHandler();
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null){
        if(await firestore.isExists("Website", data['webDomain'])){
          showToast(context: context, type: ToastificationType.error, title: 'Domain Name', desc: 'Domain Name already exists.');
          return false;
        }
        dynamic rs = await firestore.readFieldAtPath("USERS", uid, 'webDomain') ?? null;
        if(rs == null){
          await firestore.updateFirestoreData("USERS", uid, data);
          await firestore.createEmptyDocument("Website", data['webDomain']);
          firestore.closeConnection();
          showToast(context: context, type: ToastificationType.success, title: 'Domain Name', desc: 'Your Domain Name have been create.');
          return true;
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'Domain Name', desc: 'You have already registered for Domain.');
          return false;
        }
      } else{
        firestore.closeConnection();
        throw Exception('Firebase Auth not Found');
      }
      firestore.closeConnection();
      return false;
    } catch(e) {
      debugPrint('$e');
    }
    return false;
  }
}
