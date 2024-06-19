import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/reviews/reviews_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'web_testimonial_add_widget.dart' show WebTestimonialAddWidget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebTestimonialAddModel extends FlutterFlowModel<WebTestimonialAddWidget> {
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

  Future<bool> save(BuildContext context) async {
    try {
      String name = textController1!.value.text ?? '';
      name.trim();
      String desc = textController2!.value.text ?? '';
      desc.trim();
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;

      if(domain.isNotEmpty) {
        if(name.isNotEmpty && desc.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          Map<String,dynamic> data = {
            'name' : name,
            'description' : desc
          };
          await firestore.pushToArray("Website", domain, "Reviews", data);
          List<dynamic> dynlist= await firestore.readFieldAtPath("Website", domain, "Reviews") ?? [];
          // List<Reviews> list= await firestore.readFieldAtPath("Website", domain, "Reviews") ?? [];
          List<Reviews> list = [];
          for (var element in dynlist) {
            if(element is Map<String, dynamic>){
              list.add(Reviews.fromMap(element));
            }
          }
          Provider.of<WebReviewsProvider>(context, listen: false).updateList(list);
          firestore.closeConnection();
          showToast(context: context, type: ToastificationType.success, title: 'Testimonials', desc: 'Information have been saved.');
          return true;
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'Testimonials', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'Testimonials', desc: 'Please Register domain first.');
      }
      return false;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'Testimonials', desc: 'Exception');
      return false;
    }
  }
}
