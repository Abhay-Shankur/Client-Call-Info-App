import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import '/pages/pages/components/call_log_list_item/call_log_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

import 'call_logs_model.dart';
export 'call_logs_model.dart';

class CallLogsWidget extends StatefulWidget {
  const CallLogsWidget({super.key});

  @override
  State<CallLogsWidget> createState() => _CallLogsWidgetState();
}

class _CallLogsWidgetState extends State<CallLogsWidget> {
  late CallLogsModel _model;
  List<CallLogEntry> _callLogs = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogsModel());
    _retrieveCallLogs();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _retrieveCallLogs() async {
    if (await Permission.phone.request().isGranted) {
      var callLogs = await CallLog.get();
      setState(() {
        _callLogs = callLogs.toList();
      });
    }
  }

  String getMessageForCallType(CallType? callType) {
    if (callType == null) {
      return 'Unknown call type';
    }

    switch (callType) {
      case CallType.incoming:
        return 'Incoming call';
      case CallType.outgoing:
        return 'Outgoing call';
      case CallType.missed:
        return 'Missed call';
      case CallType.rejected:
        return 'Rejected call';
      case CallType.blocked:
        return 'Blocked call';
      default:
        return 'Unknown call type';
    }
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
            icon: const Icon(
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
          actions: const [],
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
                  alignment: const AlignmentDirectional(0, -1),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 970,
                    ),
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: MyTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment: const AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          alignment: const AlignmentDirectional(1, 0),
                                          child: Text(
                                            'Status',
                                            style: MyTheme.of(context)
                                                .labelSmall,
                                          ),
                                        ),
                                      ].addToEnd(const SizedBox(width: 10)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.fromLTRB(0,0,0,44,),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _callLogs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var call = _callLogs[index];
                              var callTypeMessage = getMessageForCallType(call.callType);
                              debugPrint('Call: ${call.toString()}');
                              return wrapWithModel(
                                model: _model.callLogListItemModel,
                                updateCallback: () => setState(() {}),
                                child: CallLogListItemWidget(
                                  logName: call.name.toString(),
                                  logNumber: call.number.toString(),
                                  logStatus: call.simDisplayName,
                                ),
                              );
                            },
                            // children: [
                            //   wrapWithModel(
                            //     model: _model.callLogListItemModel,
                            //     updateCallback: () => setState(() {}),
                            //     child: CallLogListItemWidget(),
                            //   ),
                            // ].divide(SizedBox(height: 1)),
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
