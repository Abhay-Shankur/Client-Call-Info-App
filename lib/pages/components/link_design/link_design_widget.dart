import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'link_design_model.dart';
export 'link_design_model.dart';

class LinkDesignWidget extends StatefulWidget {
  const LinkDesignWidget({super.key});

  @override
  State<LinkDesignWidget> createState() => _LinkDesignWidgetState();
}

class _LinkDesignWidgetState extends State<LinkDesignWidget> {
  late LinkDesignModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkDesignModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 13),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Enter your domain',
                labelStyle: MyTheme.of(context).labelLarge.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.of(context).alternate,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.of(context).primary,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.of(context).error,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.of(context).error,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: MyTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 8),
              ),
              style: MyTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
              maxLines: null,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: FlutterFlowIconButton(
            borderColor: MyTheme.of(context).primary,
            borderRadius: 15,
            borderWidth: 1,
            buttonSize: 40,
            fillColor: MyTheme.of(context).accent1,
            icon: Icon(
              Icons.add,
              color: MyTheme.of(context).primaryText,
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ),
      ],
    );
  }
}
