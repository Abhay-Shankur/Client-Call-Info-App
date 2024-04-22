import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'call_log_model.dart';
export 'call_log_model.dart';

class CallLogWidget extends StatefulWidget {
  const CallLogWidget({
    super.key,
    required this.iconType,  required this.name, required this.number,
  });

  final Widget? iconType;
  final String name;
  final String number;

  @override
  State<CallLogWidget> createState() => _CallLogWidgetState();
}

class _CallLogWidgetState extends State<CallLogWidget> {
  late CallLogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        decoration: BoxDecoration(
          color: MyTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.iconType!,
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 10, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'John Doe',
                            maxLines: 1,
                            style: MyTheme.of(context)
                                .titleMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              color:
                              MyTheme.of(context).primaryText,
                              fontSize: 20,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Resend',
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: MyTheme.of(context).primary,
                              textStyle: MyTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                          child: Text(
                            '702823####',
                            maxLines: 1,
                            style:
                            MyTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: MyTheme.of(context)
                                  .secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
