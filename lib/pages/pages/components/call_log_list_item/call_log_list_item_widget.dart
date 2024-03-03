import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'call_log_list_item_model.dart';
export 'call_log_list_item_model.dart';

class CallLogListItemWidget extends StatefulWidget {
  const CallLogListItemWidget({
    super.key,
    String? logName,
    String? logNumber,
    String? logStatus,
  })  : this.logName = logName ?? 'Call Log Name',
        this.logNumber = logNumber ?? 'Call Log Number',
        this.logStatus = logStatus ?? 'Status';

  final String logName;
  final String logNumber;
  final String logStatus;

  @override
  State<CallLogListItemWidget> createState() => _CallLogListItemWidgetState();
}

class _CallLogListItemWidgetState extends State<CallLogListItemWidget> {
  late CallLogListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: MyTheme.of(context).alternate,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.logName,
                      style: MyTheme.of(context).bodyLarge,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Text(
                        widget.logNumber,
                        style: MyTheme.of(context).labelSmall.override(
                          fontFamily: 'Inter',
                          color: MyTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 4)),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: () {
                      if (widget.logStatus == 'Sent') {
                        return MyTheme.of(context).success;
                      } else if (widget.logStatus == 'Blocked') {
                        return MyTheme.of(context).warning;
                      } else {
                        return MyTheme.of(context).accent3;
                      }
                    }(),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: MyTheme.of(context).tertiary,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                      child: Text(
                        widget.logStatus,
                        style: MyTheme.of(context).bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
