import 'dart:io';

import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/firebaseHandlers/firebase_storage.dart';
import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:toastification/toastification.dart';
import 'web_save_product_widget.dart' show WebSaveProductWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebSaveProductModel extends FlutterFlowModel<WebSaveProductWidget> {
  ///  State fields for stateful widgets in this page.
  File? pickedFile = null;

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode1;
  TextEditingController? productNameTextController1;
  String? Function(BuildContext, String?)? productNameTextController1Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameTextController2;
  String? Function(BuildContext, String?)? productNameTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  late BuildContext localContext;


  @override
  void initState(BuildContext context) {
    localContext = context;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    productNameFocusNode1?.dispose();
    productNameTextController1?.dispose();

    productNameFocusNode2?.dispose();
    productNameTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
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

  bool isFileAvailable() {
    return pickedFile != null ? true : false;
  }

  File? getPickedFile(BuildContext context)
  {
    if (pickedFile != null) {
      return pickedFile;
    } else {
      print("Null image");
      showToast(
          context: context,
          type: ToastificationType.info,
          title: "Image Null",
          desc: "Please Select the Image First."
      );
      return null;
    }
  }

  Future<bool> createProduct(BuildContext context) async {
    try {

      String domainName = Provider.of<WebDomainProvider>(context, listen: false).domainName;
      String? imagePath = await FirebaseStorageService.uploadImage(pickedFile!,'$domainName/');

      Product product = new Product();
      product.imagePath = imagePath.toString();
      product.productName = productNameTextController1!.value.text.toString();
      product.productPrice = productNameTextController2!.value.text.toString();
      product.productDescription = descriptionTextController!.value.text.toString();

      List<Product> list = Provider.of<ProductsProvider>(context, listen: false).listProducts;
      list.add(product);
      Provider.of<ProductsProvider>(context, listen: false).addProduct(list);

      FirestoreHandler firestore = FirestoreHandler();
      List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, "ProductsList") as List<dynamic>;
      dynlist.add(product.toMap());
      debugPrint('Updated List: ${dynlist.toString()}');
      await firestore.updateFirestoreData("Website", domainName, {'ProductsList': dynlist });
      firestore.closeConnection();
      showToast(context: context, type: ToastificationType.success, title: 'Products', desc: 'Products have been Added.');
      return true;
    } catch (e) {
      debugPrint('Exception...$e');
      showToast(context: context, type: ToastificationType.error, title: 'Products', desc: 'Failed to save product information!');
      return false;
    }
  }
}
