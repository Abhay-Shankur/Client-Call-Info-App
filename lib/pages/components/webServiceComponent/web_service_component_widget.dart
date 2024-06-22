import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'web_service_component_model.dart';
export 'web_service_component_model.dart';

class WebServiceComponentWidget extends StatefulWidget {
  const WebServiceComponentWidget({super.key});

  @override
  State<WebServiceComponentWidget> createState() =>
      _WebServiceComponentWidgetState();
}

class _WebServiceComponentWidgetState extends State<WebServiceComponentWidget> {
  late WebServiceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebServiceComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: TextFormField(
            controller: _model.textController1,
            focusNode: _model.textFieldFocusNode1,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Label here...',
              labelStyle: MyTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.of(context).primaryText,
                letterSpacing: 0,
              ),
              hintStyle: MyTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).alternate,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).error,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).error,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: MyTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
            ),
            validator: _model.textController1Validator.asValidator(context),
          ),
        ),
        Divider(
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: MyTheme.of(context).primaryText,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child: TextFormField(
            controller: _model.textController2,
            focusNode: _model.textFieldFocusNode2,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Service Description here',
              labelStyle: MyTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
              alignLabelWithHint: true,
              hintStyle: MyTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).secondaryText,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).secondaryText,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).secondaryText,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyTheme.of(context).secondaryText,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
            ),
            style: MyTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
            ),
            textAlign: TextAlign.start,
            maxLines: 10,
            validator: _model.textController2Validator.asValidator(context),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 24),
          child: FFButtonWidget(
            onPressed: () {
              debugPrint('Button pressed ...');
            },
            text: 'Save Information',
            options: FFButtonOptions(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: MyTheme.of(context).primaryText,
              textStyle: MyTheme.of(context).titleMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.of(context).secondaryBackground,
                letterSpacing: 0,
              ),
              elevation: 4,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
              hoverColor: MyTheme.of(context).primaryText,
            ),
          ),
        ),
      ],
    );
  }
}
