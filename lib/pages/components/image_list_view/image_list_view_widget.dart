import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/pages/components/image_list_tile/image_list_tile_widget.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'image_list_view_model.dart';
export 'image_list_view_model.dart';

class ImageListViewWidget extends StatefulWidget {
  const ImageListViewWidget({
    super.key,
    this.listParam,
  });

  final List<dynamic>? listParam;

  @override
  State<ImageListViewWidget> createState() => _ImageListViewWidgetState();
}

class _ImageListViewWidgetState extends State<ImageListViewWidget> {
  late ImageListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageListViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listParams = widget.listParam?.toList() ?? [];
        if (listParams.isEmpty) {
          // Show an image if list is empty
          return Center(
            child: Image.asset(
              'assets/images/noDataExists.jpg', // Replace with your image asset path
              width: 300,
              height: 300,
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listParams.length,
            itemBuilder: (context, listParamsIndex) {
              Product listParamsItem = listParams[listParamsIndex];
              return Container(
                height: 200,
                child: wrapWithModel(
                  model: _model.imageListTileModels.getModel(
                    listParamsIndex.toString(),
                    listParamsIndex,
                  ),
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: ImageListTileWidget(
                    key: Key(
                      'Keyjfy_${listParamsIndex.toString()}',
                    ),
                    imagePath: listParamsItem.imagePath,
                    productName: listParamsItem.productName,
                    productPrice: listParamsItem.productPrice,
                    productDescription: listParamsItem.productDescription,
                    editFunc: () async {
                      debugPrint('Editing at Index: $listParamsIndex');
                    },
                    deleteFunc: () async {
                      deleteFunc(type: 'ProductsList', index: listParamsIndex, context: context);
                    },
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }


  Future<void> editFunc({required String type, required int index, required BuildContext context}) async {
    debugPrint('Type: $type, Index: $index');
  }

  Future<void> deleteFunc({required String type, required int index, required BuildContext context}) async {
    debugPrint('Type: $type, Index: $index');
    try {
      String uid = FirebaseAuthHandler.getUid() ?? '';
      if(uid.isNotEmpty) {
        String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
        if(domain.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          await firestore.deleteListItemAtIndexAtPath("Website", domain, type, index);
          firestore.closeConnection();
          Provider.of<WebProductsProvider>(context, listen: false).removeAt(index);
          showToast(context: context, type: ToastificationType.success, title: "Products List", desc: "Product has been deleted");
        } else {
          debugPrint('Domain not authenticated.');
          showToast(context: context, type: ToastificationType.info, title: "Products List", desc: "Please register your Domain.");
        }
      } else {
        debugPrint('User not authenticated.');
        showToast(context: context, type: ToastificationType.info, title: "Products List", desc: "Not a User.");
      }
    } catch (e) {
      debugPrint('Exception : $e ');
      showToast(context: context, type: ToastificationType.error, title: "Products List", desc: "Error occurred.");
    }
  }
}
