import 'package:call_info/main.dart';
import 'package:call_info/pages/components/link_design/link_design_widget.dart';


import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/web_page_editor_card/web_page_editor_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'web_page_editor_model.dart';
export 'web_page_editor_model.dart';

class WebPageEditorWidget extends StatefulWidget {
  const WebPageEditorWidget({super.key});

  @override
  State<WebPageEditorWidget> createState() => _WebPageEditorWidgetState();
}

class _WebPageEditorWidgetState extends State<WebPageEditorWidget> {
  late WebPageEditorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebPageEditorModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Web Page Editor',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 30,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.linkDesignModel,
                  updateCallback: () => setState(() {}),
                  child: LinkDesignWidget(),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Quick services',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                navigator.currentState!.pushNamed(routeKeys.webMetadataPage);
                              },
                              child: wrapWithModel(
                                model: _model.webPageEditorCardModel1,
                                updateCallback: () => setState(() {}),
                                child: WebPageEditorCardWidget(
                                  text: 'Master Data',
                                  icon: FaIcon(
                                    FontAwesomeIcons.paste,
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel2,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Products',
                                icon: FaIcon(
                                  FontAwesomeIcons.cartPlus,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel3,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Photo Gallery',
                                icon: FaIcon(
                                  FontAwesomeIcons.photoVideo,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                navigator.currentState!.pushNamed(routeKeys.webVideoGallery);
                              },
                              child: wrapWithModel(
                                model: _model.webPageEditorCardModel4,
                                updateCallback: () => setState(() {}),
                                child: WebPageEditorCardWidget(
                                  text: 'Video Gallery',
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidFileVideo,
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel5,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Master Data',
                                icon: FaIcon(
                                  FontAwesomeIcons.paste,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel6,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Products',
                                icon: FaIcon(
                                  FontAwesomeIcons.cartPlus,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel7,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Services',
                                icon: Icon(
                                  Icons.design_services,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel8,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Why Choose Us',
                                icon: FaIcon(
                                  FontAwesomeIcons.userCheck,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel9,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Testimonial',
                                icon: Icon(
                                  Icons.rate_review,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.webPageEditorCardModel10,
                              updateCallback: () => setState(() {}),
                              child: WebPageEditorCardWidget(
                                text: 'Why Choose Us',
                                icon: FaIcon(
                                  FontAwesomeIcons.link,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
