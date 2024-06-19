import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'image_list_tile_model.dart';
export 'image_list_tile_model.dart';

class ImageListTileWidget extends StatefulWidget {
  const ImageListTileWidget({
    super.key,
    required this.imagePath,
    String? productName,
    String? productPrice,
    String? productDescription,
    required this.editFunc,
    required this.deleteFunc,
  })  : productName = productName ?? 'Product Name',
        productPrice = productPrice ?? '00.00',
        productDescription = productDescription ?? 'Product Description';

  final String? imagePath;
  final String productName;
  final String productPrice;
  final String productDescription;
  final Future Function()? editFunc;
  final Future Function()? deleteFunc;

  @override
  State<ImageListTileWidget> createState() => _ImageListTileWidgetState();
}

class _ImageListTileWidgetState extends State<ImageListTileWidget> {
  late ImageListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageListTileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Container(
        width: double.infinity,
        height: 125,
        decoration: BoxDecoration(
          color: MyTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: MyTheme.of(context).backgroundComponents,
              offset: const Offset(
                1,
                1,
              ),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'ControllerImage',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: widget.imagePath != null ?
                        Image.network(
                          widget.imagePath!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ) :
                        Image.asset(
                          'assets/images/productImage.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          widget.productName,
                          style: MyTheme.of(context)
                              .titleSmall
                              .override(
                            fontFamily: 'Readex Pro',
                            color: MyTheme.of(context).primaryText,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Text(
                        widget.productPrice,
                        style: MyTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          widget.productDescription,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style:
                          MyTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: MyTheme.of(context).secondaryText,
                        size: 20,
                      ),
                      onPressed: () async {
                        await widget.editFunc!.call();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFE86969),
                        size: 20,
                      ),
                      onPressed: () async {
                        await widget.deleteFunc!.call();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
