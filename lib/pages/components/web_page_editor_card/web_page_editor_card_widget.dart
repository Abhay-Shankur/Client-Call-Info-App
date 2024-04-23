import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'web_page_editor_card_model.dart';
export 'web_page_editor_card_model.dart';

class WebPageEditorCardWidget extends StatefulWidget {
  const WebPageEditorCardWidget({
    super.key,
    String? text,
    required this.icon,
  }) : this.text = text ?? 'Card Text';

  final String text;
  final Widget? icon;

  @override
  State<WebPageEditorCardWidget> createState() =>
      _WebPageEditorCardWidgetState();
}

class _WebPageEditorCardWidgetState extends State<WebPageEditorCardWidget> {
  late WebPageEditorCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebPageEditorCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: MyTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: widget.icon!,
              ),
              Text(
                widget.text,
                style: MyTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend',
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
