
import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/metadata/metadata_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'webMetadatamodel.dart';
export 'webMetadatamodel.dart';

class WebMetadataPageWidget extends StatefulWidget {
  const WebMetadataPageWidget({super.key});

  @override
  State<WebMetadataPageWidget> createState() => _WebMetadataPageWidgetState();
}

class _WebMetadataPageWidgetState extends State<WebMetadataPageWidget> {
  late WebMetadataPageModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebMetadataPageModel());


    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();
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
      child: Stack(
        children: [
          Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: true,
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
                'Master Data',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                  letterSpacing: 0,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 1,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 670,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Generated code for this Container Widget...
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await _model.pickFile();
                                      setState(() {
                                        _model.pickedFile;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 175,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context).alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: Consumer<WebMetaDataProvider> (
                                            builder: (context, value, child) {
                                              if(_model.pickedFile != null) {
                                                return Image.file(
                                                  _model.pickedFile!,
                                                  width: 300,
                                                  height: 63,
                                                  fit: BoxFit.contain,
                                                );
                                              } else if (value.imageBanner != null) {
                                                return FadeInImage(
                                                    placeholder: const AssetImage('assets/images/productImage.jpg'),
                                                    image: NetworkImage(value.imageBanner!),
                                                    width: 300,
                                                    height: 63,
                                                    fit: BoxFit.contain,
                                                );
                                              } else {
                                                return Image.asset(
                                                  'assets/images/uploadImage.jpg',
                                                  width: 300,
                                                  height: 63,
                                                  fit: BoxFit.contain,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider> (
                                    builder: (context, value, child) {
                                      if(value.ownerName != null) {
                                        _model.textController1 = TextEditingController(text: value.ownerName);
                                      }
                                      return TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Owner name',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: _model.textController1Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider>(
                                    builder: (context, value, child){
                                      if(value.ownerContact != null) {
                                        _model.textController2 = TextEditingController(text: value.ownerContact);
                                      }
                                      return TextFormField(
                                        controller: _model.textController2,
                                        focusNode: _model.textFieldFocusNode2,
                                        maxLength: 10,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Owner Contact',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        validator: _model.textController2Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider>(
                                    builder: (context, value, child) {
                                      if(value.businessName != null) {
                                        _model.textController3 = TextEditingController(text: value.businessName);
                                      }
                                      return TextFormField(
                                        controller: _model.textController3,
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Business Name',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: _model.textController3Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider>(
                                    builder: (context, value, child) {
                                      if(value.businessContact != null) {
                                        _model.textController4 = TextEditingController(text: value.businessContact);
                                      }
                                      return TextFormField(
                                        controller: _model.textController4,
                                        focusNode: _model.textFieldFocusNode4,
                                        maxLength: 10,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Business Contact',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        validator: _model.textController4Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider>(
                                    builder: (context, value, child) {
                                      if(value.businessMail != null) {
                                        _model.textController5 = TextEditingController(text: value.businessMail);
                                      }
                                      return TextFormField(
                                        controller: _model.textController5,
                                        focusNode: _model.textFieldFocusNode5,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Business Mail',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        validator: _model.textController5Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider> (
                                    builder: (context, value, child) {
                                      if(value.businessAddress != null) {
                                        _model.textController6 = TextEditingController(text: value.businessAddress);
                                      }
                                      return TextFormField(
                                        controller: _model.textController6,
                                        focusNode: _model.textFieldFocusNode6,
                                        maxLines: 2,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Business Address',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        keyboardType: TextInputType.streetAddress,
                                        validator: _model.textController6Validator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                                // Generated code for this TextField Widget...
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                  child: Consumer<WebMetaDataProvider> (
                                    builder:(context, value, child) {
                                      if(value.businessDescription != null) {
                                        _model.textController7 = TextEditingController(text: value.businessDescription);
                                      }
                                      return TextFormField(
                                        controller: _model.textController7,
                                        focusNode: _model.textFieldFocusNode7,
                                        autofocus: false,
                                        textCapitalization: TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Business Description',
                                          labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).primary,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 2,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 16, 16, 8),
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          lineHeight: 2,
                                        ),
                                        maxLines: 3,
                                        keyboardType: TextInputType.multiline,
                                        validator: _model.textController7Validator.asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(height: 15))
                                  .around(const SizedBox(height: 15)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 30, 16, 24),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                _saving = true;
                              });
                              await _model.saveInfo(context);
                              setState(() {
                                _saving = false;
                              });
                              navigator.currentState!.pop();
                            },
                            text: 'Save Information',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).primaryText,
                              textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0,
                              ),
                              elevation: 4,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              hoverColor: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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