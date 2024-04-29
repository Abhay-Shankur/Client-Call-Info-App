import 'package:call_info/pages/components/image_list_tile/image_list_tile_widget.dart';
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

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
                      debugPrint('Deleting at Index: $listParamsIndex');
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
}
