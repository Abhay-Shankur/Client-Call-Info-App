// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_choice_chips.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/form_field_controller.dart';
import 'dart:io';

import 'package:call_info/theme/MyTheme.dart';
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
                                    color: MyTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: MyTheme.of(context)
                                          .alternate,
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
                                                          style: MyTheme
                                                                  .of(context)
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
                                                            MyTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Slider(
                                              //   activeColor:
                                              //       MyTheme.of(context)
                                              //           .primaryText,
                                              //   inactiveColor:
                                              //       MyTheme.of(context)
                                              //           .primaryText,
                                              //   min: 0,
                                              //   max: 90,
                                              //   value: _model.sliderValue ??= 0,
                                              //   onChanged: (newValue) {
                                              //     newValue = double.parse(
                                              //         newValue
                                              //             .toStringAsFixed(2));
                                              //     setState(() => _model
                                              //         .sliderValue = newValue);
                                              //   },
                                              // ),
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
                                                onChanged:  (val) {
                                                  final selectedValue = val?.firstOrNull ?? '';

                                                  setState(() {
                                                    _model.choiceChipsValue = selectedValue;
                                                  });
                                                  showSelectedChipValue(selectedValue);
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      MyTheme.of(
                                                              context)
                                                          .accent2,
                                                  textStyle: MyTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            MyTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                      ),
                                                  iconColor:
                                                      MyTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 0,
                                                  elevation: 0,
                                                  borderColor:
                                                      MyTheme.of(
                                                              context)
                                                          .secondary,
                                                  borderWidth: 2,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      MyTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  textStyle: MyTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            MyTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                  iconColor:
                                                      MyTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 0,
                                                  elevation: 0,
                                                  borderColor:
                                                      MyTheme.of(
                                                              context)
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
                                                // wrapped: true,
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
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _selectedImagePath != null ? // Check if an image is selected
                        Image.file(
                          File(_selectedImagePath!), // Load selected image
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ) :
                        Image.asset(
                          'assets/customtemplate.png', // Use default image if no image is selected
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
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
                          labelText: 'Heading',
                          labelStyle: MyTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    MyTheme.of(context).secondaryText,
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
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child:
                        GestureDetector(
                           onTap: () {
                           selectImages();
                          },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.add_a_photo_rounded,
                              color: MyTheme.of(context).primaryText,
                              size: 32,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child:
                              GestureDetector(
                                onTap: () {
                                  selectImages();
                                },
                                child: Text(
                                'Upload Media',
                                textAlign: TextAlign.center,
                                style: MyTheme.of(context).bodyMedium,
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
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
                        color: Color(0xFF4A39EB),
                        textStyle:
                            MyTheme.of(context).titleSmall.override(
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
    String text2= _model.textController2.text;
    String text=text1 +text2;
    Fluttertoast.showToast(
      msg: text.isNotEmpty ? text : 'Text field is empty',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
  void showSelectedChipValue(String value) {
    Fluttertoast.showToast(
      msg: "Selected: $value",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,

    );
  }
  void selectImages() async {
    final ImagePicker imagePicker = ImagePicker();
    List<XFile>? imageFileList = [];

    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Only proceed if images are selected
      setState(() {
        _selectedImagePath = selectedImages[0].path; // Store the path of the first selected image
      });
    }
  }
}
