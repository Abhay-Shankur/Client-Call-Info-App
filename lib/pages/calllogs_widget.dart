import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/call_log/call_log_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'calllogs_model.dart';
import 'components/call_log/call_log_widget.dart';
export 'calllogs_model.dart';

class CalllogsWidget extends StatefulWidget {
  const CalllogsWidget({super.key});

  @override
  State<CalllogsWidget> createState() => _CalllogsWidgetState();
}

class _CalllogsWidgetState extends State<CalllogsWidget> {
  late CalllogsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalllogsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              fillColor: FlutterFlowTheme.of(context).primaryText,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                //TODO
                // context.pop();
              },
            ),
            title: Text(
              'Page Title',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.callLogModel1,
                updateCallback: () => setState(() {}),
                child: CallLogWidget(
                  iconType: Icon(
                    Icons.call_received,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.callLogModel2,
                updateCallback: () => setState(() {}),
                child: CallLogWidget(
                  iconType: Icon(
                    Icons.phone_missed,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.callLogModel3,
                updateCallback: () => setState(() {}),
                child: CallLogWidget(
                  iconType: Icon(
                    Icons.call_made,
                    color: FlutterFlowTheme.of(context).primary,
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
