import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'permission_list_item_model.dart';
export 'permission_list_item_model.dart';

class PermissionListItemWidget extends StatefulWidget {
  const PermissionListItemWidget({
    super.key,
    required this.icon,
    required this.title,
    bool? status,
  }) : this.status = status ?? false;

  final Widget? icon;
  final String? title;
  final bool status;

  @override
  State<PermissionListItemWidget> createState() =>
      _PermissionListItemWidgetState();
}

class _PermissionListItemWidgetState extends State<PermissionListItemWidget> {
  late PermissionListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PermissionListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: MyTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icon!,
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
                      'Title',
                    ),
                    style: MyTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: MyTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ),
              Switch(
                value: _model.switchValue ??= !widget.status,
                onChanged: (newValue) async {
                  setState(() => _model.switchValue = newValue);
                },
                activeColor: MyTheme.of(context).primaryText,
                activeTrackColor: MyTheme.of(context).secondaryText,
                inactiveTrackColor:
                MyTheme.of(context).secondaryBackground,
                inactiveThumbColor: MyTheme.of(context).secondaryText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
