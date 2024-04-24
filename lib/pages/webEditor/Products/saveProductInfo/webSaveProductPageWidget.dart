import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'webSaveProductPageModel.dart';
export 'webSaveProductPageModel.dart';

class WebSaveProductWidget extends StatefulWidget {
  const WebSaveProductWidget({super.key});

  @override
  State<WebSaveProductWidget> createState() => _WebSaveProductWidgetState();
}

class _WebSaveProductWidgetState extends State<WebSaveProductWidget> {
  late WebSaveProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      child: Scaffold(
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
              Navigator.pop(context);
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
                                        Container(
                                          width: double.infinity,
                                          height: 330,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                            BorderRadius.circular(12),
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
                                              BorderRadius.circular(8),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1491553895911-0055eca6402d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxzaG9lfGVufDB8fHx8MTcwODQ0NTc3OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                width: double.infinity,
                                                height: 200,
                                                fit: BoxFit.cover,
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
                                              letterSpacing: 0,
                                              fontSize: 14,
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
                                            fontSize: 16,
                                            letterSpacing: 0,
                                          ),
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
                                              fontSize: 14,
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
                                            fontSize: 14,
                                            letterSpacing: 0,
                                          ),
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
                                            fontSize: 14,
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
                        onPressed: () {
                          print('Button pressed ...');
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
    );
  }
}
