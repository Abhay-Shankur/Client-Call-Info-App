import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/weHelpTo/wehelp_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'we_help_page_model.dart';
export 'we_help_page_model.dart';

class WeHelpPageWidget extends StatefulWidget {
  const WeHelpPageWidget({super.key});

  @override
  State<WeHelpPageWidget> createState() => _WeHelpPageWidgetState();
}

class _WeHelpPageWidgetState extends State<WeHelpPageWidget>
    with TickerProviderStateMixin {
  late WeHelpPageModel _model;
  List<bool> _pick = [false, false, false];
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeHelpPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 110),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 110),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 110),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 110),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'We Help To ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Upload 3 Cover Images  And Fill The Information',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await _model.pickFile(1);
                                            setState(() {
                                              _pick[0] = true;
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8),

                                            child: Consumer<WebWeHelpProvider> (
                                              builder: (context, value, child) {
                                                if(value.image1 != null) {
                                                  return FadeInImage(
                                                    placeholder: AssetImage('assets/images/loading.gif'), // Placeholder image while loading
                                                    image: NetworkImage(value.image1!), // Network image to load
                                                    width: 300,
                                                    fit: BoxFit.cover,
                                                  );
                                                } else {
                                                  if(_pick[0]) {
                                                    return Image.file(
                                                      _model.pickedFile1!,
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return Image.asset(
                                                      'assets/images/productImage.jpg',
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                              ),
                              Expanded(
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await _model.pickFile(2);
                                            setState(() {
                                              _pick[1] = true;
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            child: Consumer<WebWeHelpProvider> (
                                              builder: (context, value, child) {
                                                if(value.image2 != null) {
                                                  return FadeInImage(
                                                    placeholder: AssetImage('assets/images/loading.gif'), // Placeholder image while loading
                                                    image: NetworkImage(value.image2!), // Network image to load
                                                    width: 300,
                                                    fit: BoxFit.cover,
                                                  );
                                                } else {
                                                  if(_pick[1]) {
                                                    return Image.file(
                                                      _model.pickedFile2!,
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return Image.asset(
                                                      'assets/images/productImage.jpg',
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                              ),
                              Expanded(
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await _model.pickFile(3);
                                            setState(() {
                                              _pick[2] = true;
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            child: Consumer<WebWeHelpProvider> (
                                              builder: (context, value, child) {
                                                if(value.image3 != null ){
                                                  return FadeInImage(
                                                    placeholder: AssetImage('assets/images/loading.gif'), // Placeholder image while loading
                                                    image: NetworkImage(value.image3!), // Network image to load
                                                    width: 300,
                                                    fit: BoxFit.cover,
                                                  );
                                                } else {
                                                  if(_pick[2]) {
                                                    return Image.file(
                                                      _model.pickedFile3!,
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else{
                                                    return Image.asset(
                                                      'assets/images/productImage.jpg',
                                                      width: 300,
                                                      fit: BoxFit.cover,
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation4']!),
                              ),
                            ]
                                .divide(SizedBox(width: 8))
                                .around(SizedBox(width: 8)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                      Divider(
                        thickness: 2,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Consumer<WebWeHelpProvider> (
                        builder: (context, value, child) {
                          if(value.heading != null) _model.textController1 = TextEditingController(text: value.heading!);
                          return TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Heading',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                fontFamily: 'Outfit',
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
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
                          );
                        },
                      ),
                      Consumer<WebWeHelpProvider> (
                        builder: (context, value, child) {
                          if(value.description != null) _model.textController2 = TextEditingController(text: value.description!);
                          return TextFormField(
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
                              hintText:
                              'Short Description of the title in 2-4 lines',
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
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 16))
                        .addToStart(SizedBox(height: 12)),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await _model.save(context);
                      },
                      text: 'Save',
                      icon: Icon(
                        Icons.receipt_long,
                        size: 15,
                      ),
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
