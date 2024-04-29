import 'package:call_info/main.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/theme/MyTheme.dart';

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
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
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebPageEditorModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      child: Stack(
        children: [
          Scaffold(
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
                    // wrapWithModel(
                    //   model: _model.linkDesignModel,
                    //   updateCallback: () => setState(() {}),
                    //   child: LinkDesignWidget(),
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 13),
                            child: Consumer<WebDomainProvider>(
                              builder: (context, value, child) {
                                _model.textController = TextEditingController(text: value.domainName);
                                return TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Enter your domain',
                                    labelStyle: MyTheme.of(context).labelLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context).alternate,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context).primary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: MyTheme.of(context).secondaryBackground,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 8),
                                  ),
                                  style: MyTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                                  maxLines: null,
                                  validator: _model.textControllerValidator.asValidator(context),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Consumer<WebDomainProvider> (
                            builder: (context, value, child) {
                              return FlutterFlowIconButton(
                                borderColor: MyTheme.of(context).primary,
                                borderRadius: 15,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: MyTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.add,
                                  color: MyTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  value.updateDomainName(_model.textController!.value.text);
                                  await _performBackendWork();
                                },
                              );
                            },
                          ),
                        ),
                      ],
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
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webMetadataPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel1,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Master Data',
                                      icon: FaIcon(
                                        FontAwesomeIcons.paste,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webProductsPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel2,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Products',
                                      icon: FaIcon(
                                        FontAwesomeIcons.cartPlus,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
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
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webImageGallery);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel3,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Photo Gallery',
                                      icon: FaIcon(
                                        FontAwesomeIcons.photoVideo,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webVideoGallery);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel4,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Video Gallery',
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidFileVideo,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webServicesPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel7,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Services',
                                      icon: Icon(
                                        Icons.design_services,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webWeHelpPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel8,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'We help ',
                                      icon: FaIcon(
                                        FontAwesomeIcons.userCheck,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
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
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.webTestimonialPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel9,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Testimonial',
                                      icon: Icon(
                                        Icons.rate_review,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    navigator.currentState!
                                        .pushNamed(routeKeys.linkPage);
                                  },
                                  child: wrapWithModel(
                                    model: _model.webPageEditorCardModel10,
                                    updateCallback: () => setState(() {}),
                                    child: WebPageEditorCardWidget(
                                      text: 'Links',
                                      icon: FaIcon(
                                        FontAwesomeIcons.link,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40,
                                      ),
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
          if(_saving)
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black color for overlay
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to perform backend work
  Future<bool> _performBackendWork() async {
    // Set loading state to true
    setState(() {
      _saving = true;
    });
    // Perform backend work
    await _model.saveDomain(context);

    // After work is done, set loading state to false
    setState(() {
      _saving = false;
    });
    return true;
  }
}
