import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/main.dart' as main;
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'web_product_add_model.dart';
export 'web_product_add_model.dart';

class WebProductsAddWidget extends StatefulWidget {
  int? id;
  WebProductsAddWidget({super.key, this.id});

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


    _init();
  }

  Future<void> _init() async {
    try {
      if(widget.id != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String? uid = FirebaseAuthHandler.getUid();
        String domainName = await firestore.readFieldAtPath("USERS", uid!, 'webDomain');
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, 'ProductsList') ?? [];
        Map<String,dynamic> p = dynlist[widget.id!];
        Product product = Product.fromMap(p);
        _model.productNameTextController1.text = product.productName;
        _model.productNameTextController2.text = product.productPrice;
        _model.descriptionTextController.text = product.productDescription;
        // _model.pickedFile
        firestore.closeConnection();
      }
    } catch(e) {
      debugPrint("Exception: $e");
    }
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
            backgroundColor: MyTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: MyTheme.of(context).primaryBackground,
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
                  main.navigator.currentState!.pop();
                },
              ),
              title: Text(
                'Create Product',
                style: MyTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0,
                ),
              ),
              actions: const [],
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
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                        child: Text(
                          'Fill out the information below to post a product',
                          style: MyTheme.of(context).labelMedium.override(
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
                              alignment: const AlignmentDirectional(0, -1),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1270,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
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
                                        constraints: const BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: const BoxDecoration(),
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
                                                  imagePicked = _model.pickedFile!=null;
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 330,
                                                decoration: BoxDecoration(
                                                  color: MyTheme.of(context)
                                                      .primaryBackground,
                                                  boxShadow: const [
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
                                                    MyTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4),
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
                                                MyTheme.of(context)
                                                    .headlineMedium
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                ),
                                                hintStyle:
                                                MyTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                MyTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
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
                                                    MyTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                MyTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16, 20, 16, 20),
                                              ),
                                              style: MyTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18,
                                                letterSpacing: 0,
                                              ),
                                              maxLines: null,
                                              cursorColor:
                                              MyTheme.of(context)
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
                                                MyTheme.of(context)
                                                    .headlineMedium
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                ),
                                                hintStyle:
                                                MyTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                MyTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
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
                                                    MyTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                MyTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16, 20, 16, 20),
                                              ),
                                              style: MyTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18,
                                                letterSpacing: 0,
                                              ),
                                              maxLines: null,
                                              keyboardType: TextInputType.number,
                                              cursorColor:
                                              MyTheme.of(context)
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
                                                MyTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                alignLabelWithHint: true,
                                                hintStyle:
                                                MyTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                                errorStyle:
                                                MyTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .error,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .alternate,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
                                                        .primary,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                    MyTheme.of(context)
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
                                                    MyTheme.of(context)
                                                        .error,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                MyTheme.of(context)
                                                    .secondaryBackground,
                                                contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 16, 16),
                                              ),
                                              style: MyTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                              maxLines: 9,
                                              minLines: 5,
                                              cursorColor:
                                              MyTheme.of(context)
                                                  .primary,
                                              validator: _model
                                                  .descriptionTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ].divide(const SizedBox(height: 12)),
                                        ),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: const BoxDecoration(),
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
                        constraints: const BoxConstraints(
                          maxWidth: 770,
                        ),
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                _saving = true;
                              });
                              if(_model.pickedFile != null) {
                                await _model.createProduct(context);
                                setState(() {
                                  _saving = false;
                                });
                                main.navigator.currentState!.pop();
                              } else {
                                setState(() {
                                  _saving = false;
                                });
                                Get.showSnackbar(const GetSnackBar(message: 'Please Select Image.',));
                              }
                            },
                            text: 'Create Product',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48,
                              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: MyTheme.of(context).primaryText,
                              textStyle:
                              MyTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: MyTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0,
                              ),
                              elevation: 3,
                              borderSide: const BorderSide(
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
