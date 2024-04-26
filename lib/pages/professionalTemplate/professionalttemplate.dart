// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_choice_chips.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/form_field_controller.dart';
import 'dart:io';
// import 'package:debounce/debounce.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:call_log/call_log.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'promossionaltemplatesmodel.dart';
export 'promossionaltemplatesmodel.dart';

class PromossionalmsgtempWidget extends StatefulWidget {
  const PromossionalmsgtempWidget({super.key});

  @override
  State<PromossionalmsgtempWidget> createState() =>
      _PromossionalmsgtempWidgetState();
}

class _PromossionalmsgtempWidgetState extends State<PromossionalmsgtempWidget>
    with TickerProviderStateMixin {
  late PromossionalmsgtempModel _model;
  String? _selectedImagePath;
  static File? imageFile = null;
  int callCount = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
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
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 110),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromossionalmsgtempModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: MyTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: MyTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: MyTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
              // context.pop();
            },
          ),
          title: Text(
            'Promotional Message',
            style: MyTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: MyTheme.of(context).primaryText,
                  fontSize: 22,
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
                  Text(
                    'Customize Template',
                    style: MyTheme.of(context).headlineMedium,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Fill out the form below to create new  promossion',
                      style: MyTheme.of(context).labelLarge,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        MyTheme.of(context).secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: MyTheme.of(context).alternate,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 15, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 4,
                                                                    0, 0),
                                                        child: Text(
                                                          'Select Duration ',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: MyTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: MyTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 6, 0, 0),
                                                      child: Icon(
                                                        Icons.timer_sharp,
                                                        color:
                                                            MyTheme.of(context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 15),
                                              child: FlutterFlowChoiceChips(
                                                options: [
                                                  ChipData('24 hrs'),
                                                  ChipData('1 Week'),
                                                  ChipData('1 Month')
                                                ],
                                                onChanged: (val) {
                                                  // Update the selected chip value
                                                  final selectedValue =
                                                      val?.firstOrNull ?? '';
                                                  showSelectedChipValue(
                                                      selectedValue);
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      MyTheme.of(context)
                                                          .accent2,
                                                  textStyle: MyTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            MyTheme.of(context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                      ),
                                                  iconColor: MyTheme.of(context)
                                                      .primaryText,
                                                  iconSize: 0,
                                                  elevation: 0,
                                                  borderColor:
                                                      MyTheme.of(context)
                                                          .secondary,
                                                  borderWidth: 2,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      MyTheme.of(context)
                                                          .primaryBackground,
                                                  textStyle: MyTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            MyTheme.of(context)
                                                                .secondaryText,
                                                      ),
                                                  iconColor: MyTheme.of(context)
                                                      .secondaryText,
                                                  iconSize: 0,
                                                  elevation: 0,
                                                  borderColor:
                                                      MyTheme.of(context)
                                                          .alternate,
                                                  borderWidth: 1,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                chipSpacing: 0,
                                                multiselect: false,
                                                alignment:
                                                    WrapAlignment.spaceEvenly,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  ['24 hrs'],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              ),
                            ),
                          ].divide(SizedBox(width: 12)),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   decoration: BoxDecoration(),
                  //   child: Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  //     child: GestureDetector(
                  //       onTap: () async {
                  //         await _model.pickFile();
                  //         setState(() {
                  //           imageFile=_model.getPickedFile();
                  //         });
                  //       },
                  //       child: imageFile != null
                  //           ? Image.file(
                  //         imageFile!,
                  //         width: double.infinity,
                  //         height: 200,
                  //         fit: BoxFit.scaleDown,
                  //         alignment: Alignment(0, 0),
                  //       )
                  //           : Image.asset(
                  //         'assets/whatsappDefult.png',
                  //         width: double.infinity,
                  //         height: 200,
                  //         fit: BoxFit.scaleDown,
                  //         alignment: Alignment(0, 0),
                  //       ),
                  //   ),
                  // ),
                  //
                  // Generated code for this Container Widget...
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                    child: Container(
                      width: double.infinity,
                      height: 330,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: GestureDetector(
                                onTap: () async {
                                  await _model.pickFile();
                                  setState(() {
                                    imageFile=_model.getPickedFile();
                                  });
                                },
                                child: imageFile != null
                                    ? Image.file(
                                  imageFile!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment(0, 0),
                                )
                                    : Image.asset(
                                  'assets/images/uploadImage.jpg',
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment(0, 0),
                                ),
                      ),
                    ),
                  ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: FlutterFlowTheme.of(context).primaryText,
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
                          labelText: 'Heading',
                          labelStyle:
                              MyTheme.of(context).headlineSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: MyTheme.of(context).secondaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintStyle: MyTheme.of(context).labelMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        ),
                        style: MyTheme.of(context).headlineSmall,
                        cursorColor: MyTheme.of(context).primary,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: MyTheme.of(context).labelMedium,
                          hintText: 'What\'s in your mind..?',
                          hintStyle: MyTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).primaryText,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                        ),
                        style: MyTheme.of(context).bodyMedium,
                        maxLines: 16,
                        minLines: 6,
                        cursorColor: MyTheme.of(context).primary,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ]
                        .divide(SizedBox(height: 16))
                        .addToStart(SizedBox(height: 12)),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 500,
                      ),
                      decoration: BoxDecoration(
                        color: MyTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: MyTheme.of(context).alternate,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () {
                        showToast();
                        print('save Button pressed ...');
                      },
                      text: 'Save Teamplate',
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
                        textStyle: MyTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
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

  void showToast() {
    String text1 = _model.textController1.text;
    String text2 = _model.textController2.text;
    String text = text1 + "\n" + text2;
    Fluttertoast.showToast(
      msg: text.isNotEmpty ? text : 'Text field is empty',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
  // void showSelectedChipValue(String value) {
  //   Fluttertoast.showToast(
  //     msg: "Selected: $value",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //
  //   );
  // }

  void showSelectedChipValue(String value) {
    switch (value) {
      case '24 hrs':
        // Fetch and print call logs for the last 24 hours
        fetchAndPrintCallLogs(Duration(hours: 24));
        break;
      case '1 Week':
        // Fetch and print call logs for the last 7 days (1 week)
        fetchAndPrintCallLogs(Duration(days: 7));
        break;
      case '1 Month':
        // Fetch and print call logs for the last 30 days (1 month)
        fetchAndPrintCallLogs(Duration(days: 30));
        break;
      default:
        break;
    }
  }

  void fetchAndPrintCallLogs(Duration duration) async {
    callCount = 0;
    // Get the current time
    DateTime now = DateTime.now();

    // Calculate the start time based on the duration
    DateTime startTime = now.subtract(duration);

    // Fetch call logs within the specified duration
    Iterable<CallLogEntry> entries = await CallLog.query(
      dateFrom: startTime.millisecondsSinceEpoch,
      dateTo: now.millisecondsSinceEpoch,
    );

    // Print the call logs
    for (final entry in entries) {
      callCount = callCount + 1;

      print(
          'Call from: ${entry.name}, Number: ${entry.number}, Duration: ${entry.duration} seconds, Type: ${entry.callType}, Date: ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}');
    }
    print(callCount);
  }
}
