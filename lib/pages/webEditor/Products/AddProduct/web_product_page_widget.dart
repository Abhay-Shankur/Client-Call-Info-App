import 'package:call_info/main.dart';
import 'package:call_info/pages/components/image_list_view/image_list_view_widget.dart';
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'web_product_page_model.dart';
export 'web_product_page_model.dart';

class WebProductsPageWidget extends StatefulWidget {
  const WebProductsPageWidget({super.key});

  @override
  State<WebProductsPageWidget> createState() =>
      _WebProductsPageWidgetState();
}

class _WebProductsPageWidgetState extends State<WebProductsPageWidget> {
  late WebAddProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebAddProductPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'Products Section',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 16),
                      child: Text(
                        'To add products to your website, simply click on "Add Products" button and showcase your items with elegance and flair.',
                        style:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Add New Product ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Readex Pro',
                                fontSize: 28,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    navigator.currentState!.pushNamed(routeKeys.webProductsAdd);
                                  },
                                  text: 'Add Products',
                                  options: FFButtonOptions(
                                    height: 50,
                                    padding: const EdgeInsets.all(6),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0,
                                    ),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Expanded(
                flex: 1,
                child: wrapWithModel(
                  model: _model.imageListViewModel,
                  updateCallback: () => setState(() {}),
                  child: Consumer<WebProductsProvider> (
                    builder: (context, value, child) {
                      List<Product> list = [];
                      for (var element in value.listProducts) {
                        list.add(element);
                      }
                      return ImageListViewWidget(listParam: list);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}