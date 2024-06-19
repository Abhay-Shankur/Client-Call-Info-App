import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/gallery/photo_gallery_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/list_view/list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'web_image_galley_model.dart';
export 'web_image_galley_model.dart';

class WebImageGalleyWidget extends StatefulWidget {
  const WebImageGalleyWidget({super.key});

  @override
  State<WebImageGalleyWidget> createState() => _WebImageGalleyWidgetState();
}

class _WebImageGalleyWidgetState extends State<WebImageGalleyWidget> {
  late WebImageGalleyModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebImageGalleyModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();
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
            'Image Gallery',
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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 16),
                    child: Text(
                      'Add link of  your image asset from google drive to  be shown on website',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
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
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.emailAddressTextController,
                                focusNode: _model.emailAddressFocusNode,
                                autofillHints: const [AutofillHints.email],
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Your link here...',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 20, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  letterSpacing: 0,
                                ),
                                maxLines: null,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .emailAddressTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _saving = true;
                                });
                                await _model.addLink(context);
                                setState(() {
                                  _saving = false;
                                });
                              },
                              text: 'Add Link',
                              options: FFButtonOptions(
                                height: 50,
                                padding: const EdgeInsets.all(6),
                                iconPadding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primaryText,
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
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              wrapWithModel(
                model: _model.listViewModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: Hero(
                  tag: 'ControllerImage',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: Consumer<WebPhotoGalleryProvider> (
                      builder: (context, value, child) {
                        return ListViewWidget(
                          listParams: value.list,
                        );
                      },
                    )
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
