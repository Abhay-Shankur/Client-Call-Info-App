import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'setting_page_list_item_model.dart';
export 'setting_page_list_item_model.dart';

class SettingPageListItemWidget extends StatefulWidget {
  const SettingPageListItemWidget({
    super.key,
    required this.itemName,
    this.itemAction,
  });

  final String? itemName;
  final Future Function()? itemAction;

  @override
  State<SettingPageListItemWidget> createState() =>
      _SettingPageListItemWidgetState();
}

class _SettingPageListItemWidgetState extends State<SettingPageListItemWidget> {
  late SettingPageListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingPageListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // Navigator.pop(context);
        widget.itemAction?.call();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.itemName,
                  'List Item',
                ),
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
