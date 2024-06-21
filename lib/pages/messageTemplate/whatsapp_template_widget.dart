
import 'package:call_info/main.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'whatsapp_template_model.dart';
export 'whatsapp_template_model.dart';


class WhatsappTemplateWidget extends StatefulWidget {
  const WhatsappTemplateWidget({super.key});

  @override
  State<WhatsappTemplateWidget> createState() => _WhatsappTemplateWidgetState();
}

class _WhatsappTemplateWidgetState extends State<WhatsappTemplateWidget> {
  late WhatsappTemplateModel _model;

  String? _selectedImagePath;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhatsappTemplateModel());

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
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          backgroundColor: MyTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: MyTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
                // context.pop();
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: 80,
                height: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: Colors.transparent,
                textStyle: MyTheme.of(context).labelMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: MyTheme.of(context).primary,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                elevation: 0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                child: FFButtonWidget(
                  onPressed: () async {
                    // showToast();
                    setState(() {
                      _saving = true;
                    });
                    await _model.saveTemplate(context);
                    setState(() {
                      _saving = false;
                    });
                    navigator.currentState!.pop();
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    width: 70,
                    height: 32,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primaryText,
                    textStyle: MyTheme.of(context).titleSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color:FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: 2,
                    borderSide: const BorderSide(
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
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                        Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Consumer<WPProvider> (
                                builder: (_, value, __) {
                                  if (_model.pickedFile != null){
                                    return Image.file(
                                      _model.pickedFile!, // Load selected image
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.scaleDown,
                                    );
                                  } else if(value.image != null && value.image!.isNotEmpty) {
                                    return FadeInImage(
                                      placeholder: const AssetImage('assets/images/productImage.jpg'),
                                      image: NetworkImage(value.image!), // Use default image if no image is selected
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.scaleDown,
                                    );
                                  } else {
                                    return Image.asset(
                                      'assets/images/uploadImage.jpg', // Use default image if no image is selected
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.scaleDown,
                                    );
                                  }
                                },
                              )
                              // _selectedImagePath != null ? // Check if an image is selected
                              // Image.file(
                              //   File(_selectedImagePath!), // Load selected image
                              //   width: double.infinity,
                              //   height: 200,
                              //   fit: BoxFit.scaleDown,
                              // ) :
                              // Image.asset(
                              //   'assets/images/uploadImage.jpg', // Use default image if no image is selected
                              //   width: double.infinity,
                              //   height: 200,
                              //   fit: BoxFit.scaleDown,
                              // ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10, 12, 10, 12),
                                        child: Consumer<WPProvider> (
                                          builder: (_, value, __) {
                                            if(value.text != null && value.text!.isNotEmpty) {
                                              _model.textController = TextEditingController(text: value.text!);
                                            }
                                            return TextFormField(
                                              controller: _model.textController,
                                              focusNode: _model.textFieldFocusNode,
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
                                                  color: const Color(0xFF57636C),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0E3E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF4B39EF),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFF5963),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFF5963),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16, 8, 16, 12),
                                              ),
                                              style: MyTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              minLines: 10,
                                              cursorColor: const Color(0xFF4B39EF),
                                              validator: _model.textControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.96, -0.87),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          onPressed: () async {
                                            // selectImages();
                                            await _model.pickFile();
                                            setState(() {
                                              _model.pickedFile;
                                            });
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
