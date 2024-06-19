
import 'package:call_info/providers/sms/sms_provider.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'sms_template_model.dart';
export 'sms_template_model.dart';

class SMSTemplateWidget extends StatefulWidget {
  const SMSTemplateWidget({super.key});

  @override
  State<SMSTemplateWidget> createState() => _WhtstempCopyWidgetState();
}

class _WhtstempCopyWidgetState extends State<SMSTemplateWidget> {
  late SMSTemplateModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SMSTemplateModel());

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
                    setState(() {
                      _saving = true;
                    });
                    await _model.saveTemplate(context);
                    setState(() {
                      _saving = false;
                    });
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
                      color: FlutterFlowTheme.of(context).primaryBackground,
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
                                          'Customize Your Message \nTemple Here',
                                          textAlign: TextAlign.justify,
                                          maxLines: 5,
                                          style: MyTheme.of(context)
                                              .titleLarge
                                              .override(
                                            fontFamily: 'Outfit',
                                            color: MyTheme.of(context)
                                                .primaryText,
                                            fontSize: 19,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          minFontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(8),
                        //     child: Image.asset(
                        //       'assets/customtemplate.png',
                        //       width: double.infinity,
                        //       height: 200,
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 12, 10, 12),
                                  child: Consumer<SMSProvider> (
                                    builder: (_, value, __) {
                                      if(value.text != null && value.text!.isNotEmpty) {
                                        _model.textController = TextEditingController(text: value.text!);
                                      }
                                      return TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        maxLength: 160,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          const Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        textCapitalization: TextCapitalization.none,
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

}
