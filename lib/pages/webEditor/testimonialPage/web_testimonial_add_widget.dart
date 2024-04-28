import 'package:call_info/main.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'web_testimonial_add_model.dart';
export 'web_testimonial_add_model.dart';

class WebTestimonialAddWidget extends StatefulWidget {
  const WebTestimonialAddWidget({super.key});

  @override
  State<WebTestimonialAddWidget> createState() =>
      _WebTestimonialAddWidgetState();
}

class _WebTestimonialAddWidgetState extends State<WebTestimonialAddWidget> {
  late WebTestimonialAddModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebTestimonialAddModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30,
            ),
            onPressed: () async {
              navigator.currentState!.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Your Reviews Here',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 10),
                    child: Text(
                      'Fill out the form below to submit a review.',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'reviewer name',
                          labelStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                            fontFamily: 'Outfit',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                          hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        ),
                        style:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0,
                        ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                          hintText: 'Short Description of what is going on...',
                          hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                        maxLines: 16,
                        minLines: 6,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ]
                        .divide(SizedBox(height: 16))
                        .addToStart(SizedBox(height: 12)),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _saving = true;
                        });
                        await _model.save(context);
                        setState(() {
                          _saving = false;
                        });
                        navigator.currentState!.pop();
                      },
                      text: 'Submit Review',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 54,
                        padding: EdgeInsets.all(0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          letterSpacing: 0,
                        ),
                        elevation: 4,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
