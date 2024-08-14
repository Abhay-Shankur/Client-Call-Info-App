import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/services/services_provider.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/list_view2/list_view2_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'web_servic_page_model.dart';
export 'web_servic_page_model.dart';

class WebServicPageWidget extends StatefulWidget {
  const WebServicPageWidget({super.key});

  @override
  State<WebServicPageWidget> createState() => _WebServicPageWidgetState();
}

class _WebServicPageWidgetState extends State<WebServicPageWidget> {
  late WebServicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebServicPageModel());
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
        backgroundColor: MyTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: MyTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: MyTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'Services',
            style: MyTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: MyTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Click To Add Service',
                                  style: MyTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      navigator.currentState!.pushNamed(RouteKeys.webServicesAdd);
                                    },
                                    text: 'Add',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.23,
                                      height: 50,
                                      padding: const EdgeInsets.all(6),
                                      iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      color: Colors.black,
                                      textStyle: MyTheme.of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: MyTheme.of(context).primaryText,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.listView2Model,
                    updateCallback: () => setState(() {}),
                    child: Consumer<WebServicesProvider> (
                      builder: (context, value, child) {
                        List<WebServices> list = value.list;
                        return ListView2Widget(
                          listParam: list,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}