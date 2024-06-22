import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/pages/components/list_view/list_view_model.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/gallery/photo_gallery_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'web_image_galley_widget.dart' show WebImageGalleyWidget;
import 'package:flutter/material.dart';

class WebImageGalleyModel extends FlutterFlowModel<WebImageGalleyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Model for ListView component.
  late ListViewModel listViewModel;

  @override
  void initState(BuildContext context) {
    listViewModel = createModel(context, () => ListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    listViewModel.dispose();
  }

  Future<bool> addLink(BuildContext context) async {
    try {
      String link = emailAddressTextController?.value.text ?? '';
      link.trim();
      String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
      if(domain.isNotEmpty) {
        if(link.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          await firestore.pushToArray("Website", domain, "Gallery.Photos", link);
          // List<String> listLink = Provider.of<WebPhotoGalleryProvider>(context, listen: false).list;
          // listLink.add(link);
          Provider.of<WebPhotoGalleryProvider>(context, listen: false).updateList(link);
          firestore.closeConnection();
          showToast(context: context, type: ToastificationType.success, title: 'Image Gallery', desc: 'Information have been saved.');
        } else {
          showToast(context: context, type: ToastificationType.warning, title: 'Image Gallery', desc: 'Failed to Update.');
        }
      } else {
        showToast(context: context, type: ToastificationType.warning, title: 'Image Gallery', desc: 'Please Register Domain first.');
      }
      return true;
    } catch (e) {
      debugPrint('Exception: $e');
      showToast(context: context, type: ToastificationType.error, title: 'Image Gallery', desc: 'Exception');
      return false;
    }
  }
}
