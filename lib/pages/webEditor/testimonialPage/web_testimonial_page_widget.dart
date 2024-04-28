import 'package:call_info/main.dart';
import 'package:call_info/pages/components/list_view2/list_view2_widget.dart';
import 'package:call_info/providers/webEditor/reviews/reviews_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'web_testimonial_page_model.dart';
export 'web_testimonial_page_model.dart';

class WebTestimonialPageWidget extends StatefulWidget {
  const WebTestimonialPageWidget({super.key});

  @override
  State<WebTestimonialPageWidget> createState() =>
      _WebTestimonialPageWidgetState();
}

class _WebTestimonialPageWidgetState extends State<WebTestimonialPageWidget> {
  late WebTestimonialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebTestimonialPageModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'Review Page',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 10, 16, 16),
                          child: Text(
                            'To add Reviews to your website, simply click on \"Add Review\" button and showcase your quality with elegance and flair.',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Add New Review',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 10, 0),
                                    child: FFButtonWidget(
                                      onPressed: () {

                                      },
                                      text: 'Add Review',
                                      options: FFButtonOptions(
                                        height: 50,
                                        padding: EdgeInsets.all(6),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: wrapWithModel(
                  model: _model.listView2Model,
                  updateCallback: () => setState(() {}),
                  child: Consumer<WebReviewsProvider> (
                    builder: (context, value, child) {
                      List<Reviews> listR = value.list ?? [];
                       return ListView2Widget(
                        listParam: listR,
                      );
                    },
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
