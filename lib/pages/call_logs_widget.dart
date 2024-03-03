import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/pages/components/call_log_list_item/call_log_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'call_logs_model.dart';
export 'call_logs_model.dart';

class CallLogsWidget extends StatefulWidget {
  const CallLogsWidget({super.key});

  @override
  State<CallLogsWidget> createState() => _CallLogsWidgetState();
}

class _CallLogsWidgetState extends State<CallLogsWidget> {
  late CallLogsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogsModel());
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
          backgroundColor: MyTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              // context.pop();
            },
          ),
          title: Text(
            'Call Logs',
            style: MyTheme.of(context).headlineMedium.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 970,
                    ),
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: MyTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: AlignmentDirectional(-1, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Text(
                                          'Name',
                                          style: MyTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Text(
                                            'Status',
                                            style: MyTheme.of(context)
                                                .labelSmall,
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(width: 10)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              44,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              wrapWithModel(
                                model: _model.callLogListItemModel,
                                updateCallback: () => setState(() {}),
                                child: CallLogListItemWidget(),
                              ),
                            ].divide(SizedBox(height: 1)),
                          ),
                        ],
                      ),
                    ),
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
