import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/weHelpTo/weHelp_provider.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'we_help_page_model.dart';
export 'we_help_page_model.dart';

class WeHelpPageWidget extends StatefulWidget {
  const WeHelpPageWidget({super.key});

  @override
  State<WeHelpPageWidget> createState() => _WeHelpPageWidgetState();
}

class _WeHelpPageWidgetState extends State<WeHelpPageWidget> {
  late WeHelpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeHelpPageModel());

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
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'We Help To ',
            style: MyTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: MyTheme.of(context).primaryText,
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                              labelStyle: MyTheme.of(context)
                                  .headlineSmall
                                  .override(
                                fontFamily: 'Outfit',
                                color:
                                MyTheme.of(context).secondaryText,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                              ),
                              hintStyle:
                              MyTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
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
                              const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                            ),
                            style:
                            MyTheme.of(context).headlineSmall.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0,
                            ),
                            cursorColor: MyTheme.of(context).primary,
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
                              MyTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                              hintText:
                              'Short Description of the title in 2-4 lines',
                              hintStyle:
                              MyTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
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
                              const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                            ),
                            style: MyTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                            maxLines: 16,
                            minLines: 6,
                            cursorColor: MyTheme.of(context).primary,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await _model.save(context);
                            navigator.currentState!.pop();
                          },
                          text: 'Save',
                          icon: const Icon(
                            Icons.receipt_long,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 54,
                            padding: const EdgeInsets.all(0),
                            iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: MyTheme.of(context).primaryText,
                            textStyle: MyTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Readex Pro',
                              color: MyTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0,
                            ),
                            elevation: 4,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16))
                        .addToStart(const SizedBox(height: 12)),
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
