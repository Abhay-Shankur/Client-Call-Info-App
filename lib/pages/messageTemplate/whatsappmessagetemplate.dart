import 'dart:io';

import 'package:call_info/pages/messageTemplate/CustomTemplate.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'whatsappmessagemodel.dart';
export 'whatsappmessagemodel.dart';


class WhatsappTemplateWidget extends StatefulWidget {
  const WhatsappTemplateWidget({super.key});

  @override
  State<WhatsappTemplateWidget> createState() => _WhatsappTemplateWidgetState();
}

class _WhatsappTemplateWidgetState extends State<WhatsappTemplateWidget> {
  late WhtstempModel _model;
  String? _selectedImagePath;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhtstempModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: MyTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: FFButtonWidget(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomtemplateWidget()),
            );
            // context.pop();
          },
          text: 'Cancel',
          options: FFButtonOptions(
            width: 80,
            height: 40,
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: Colors.transparent,
            textStyle: MyTheme.of(context).labelMedium.override(
              fontFamily: 'Plus Jakarta Sans',
              color: MyTheme.of(context).primary,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            elevation: 0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
            child: FFButtonWidget(
              onPressed: () {
                // showToast();
                _model.saveTemplate();
                print('Button pressed ...');
              },
              text: 'Save',
              options: FFButtonOptions(
                width: 70,
                height: 32,
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: Color(0xFF4B39EF),
                textStyle: MyTheme.of(context).titleSmall.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                elevation: 2,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: AutoSizeText(
                                      'Customize Your Whatsapp Message \nTemplate Here',
                                      textAlign: TextAlign.justify,
                                      maxLines: 5,
                                      style: MyTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: MyTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      minFontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(),
                    //   child: Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(8),
                    //       child: Image.asset(
                    //         'assets/customtemplate.png',
                    //         width: double.infinity,
                    //         height: 171,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 12, 10, 12),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      textCapitalization:
                                      TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'What\'s happening?',
                                        hintStyle: MyTheme.of(context)
                                            .labelLarge
                                            .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF4B39EF),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 16, 12),
                                      ),
                                      style: MyTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      minLines: 10,
                                      cursorColor: Color(0xFF4B39EF),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.96, -0.87),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 6, 12, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      hoverColor:
                                      MyTheme.of(context).accent3,
                                      hoverIconColor:
                                      MyTheme.of(context)
                                          .primaryText,
                                      icon: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        color: MyTheme.of(context)
                                            .primaryText,
                                        size: 32,
                                      ),
                                      onPressed: () {
                                        // selectImages();
                                        _model.pickFile();
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  // void selectImages() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   List<XFile>? imageFileList = [];
  //
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     imageFileList!.addAll(selectedImages);
  //   }
  //   print("Image List Length:" + imageFileList!.length.toString());
  //   setState(() {});
  // }
  // void selectImages() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   List<XFile>? imageFileList = [];
  //
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages != null && selectedImages.isNotEmpty) {
  //     // Only proceed if images are selected
  //     setState(() {
  //       _selectedImagePath = selectedImages[0].path; // Store the path of the first selected image
  //     });
  //   }
  // }
}
