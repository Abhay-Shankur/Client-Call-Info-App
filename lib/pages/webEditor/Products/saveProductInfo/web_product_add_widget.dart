import 'package:call_info/main.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'web_product_add_model.dart';
export 'web_product_add_model.dart';

class WebProductsAddWidget extends StatefulWidget {
  const WebProductsAddWidget({super.key});

  @override
  State<WebProductsAddWidget> createState() => _WebProductsAddWidgetState();
}

class _WebProductsAddWidgetState extends State<WebProductsAddWidget> {
  late WebSaveProductModel _model;
  bool imagePicked = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebSaveProductModel());

    _model.productNameTextController1 ??= TextEditingController();
    _model.productNameFocusNode1 ??= FocusNode();

    _model.productNameTextController2 ??= TextEditingController();
    _model.productNameFocusNode2 ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
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
      child: Stack (
        children: [
          Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
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
                'Create Product',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                        child: Text(
                          'Fill out the information below to post a product',
                          style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 1270,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  imagePicked = false;
                                                });
                                                await _model.pickFile();
                                                debugPrint('Pick Image');
                                                setState(() {
                                                  imagePicked = true;
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 330,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0,
                                                        2,
                                                      ),
                                                      spreadRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(24),
                                                  border: Border.all(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(24),
                                                    child: _model.isFileAvailable() ?
                                                    Image.file(
                                                      _model.getPickedFile(context)!,
                                                      width: 300,
                                                      height: 200,
                                                      fit: BoxFit.contain,
                                                    ) :
                                                    Image.asset(
                                                      'assets/images/uploadImage.jpg',
                                                      width: 300,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    )
                                                    ,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller:
                                              _model.productNameTextController1,
                                              focusNode:
                                              _model.productNameFocusNode1,
                                              autofocus: true,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Product name...',
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                ),
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 20, 16, 20),
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18,
                                                letterSpacing: 0,
                                              ),
                                              maxLines: null,
                                              cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              validator: _model
                                                  .productNameTextController1Validator
                                                  .asValidator(context),
                                            ),
                                            TextFormField(
                                              controller:
                                              _model.productNameTextController2,
                                              focusNode:
                                              _model.productNameFocusNode2,
                                              autofocus: true,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Product Price',
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                ),
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 20, 16, 20),
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18,
                                                letterSpacing: 0,
                                              ),
                                              maxLines: null,
                                              keyboardType: TextInputType.number,
                                              cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              validator: _model
                                                  .productNameTextController2Validator
                                                  .asValidator(context),
                                            ),
                                            TextFormField(
                                              controller:
                                              _model.descriptionTextController,
                                              focusNode:
                                              _model.descriptionFocusNode,
                                              autofocus: true,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Description...',
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                alignLabelWithHint: true,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 16, 16),
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                              maxLines: 9,
                                              minLines: 5,
                                              cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              validator: _model
                                                  .descriptionTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ].divide(SizedBox(height: 12)),
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 770,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                _saving = true;
                              });
                              await _model.createProduct(context);
                              setState(() {
                                _saving = false;
                              });
                              navigator.currentState!.pop();
                            },
                            text: 'Create Product',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48,
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).primaryText,
                              textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if(_saving)
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black color for overlay
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
