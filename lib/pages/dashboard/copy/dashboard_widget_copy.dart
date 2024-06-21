

import 'package:call_log/call_log.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../theme/my_theme.dart';
import '../../components/card_call/card_call_widget.dart';
import '../../editProfile/edit_profile_widget.dart';
import 'dashboard_model_copy.dart';
export 'dashboard_model_copy.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;
  int incomingCalls = 0;
  int outgoingCalls = 0;
  int totalcalls = 0;
  int missedCalls = 0;


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 600.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: 0,
              end: 1,
            ),
            MoveEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: const Offset(0, 30),
              end: const Offset(0, 0),
            ),
          ],
        ),
        'containerOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 1600.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 1600.ms,
              duration: 600.ms,
              begin: 0,
              end: 1,
            ),
            MoveEffect(
              curve: Curves.easeInOut,
              delay: 1600.ms,
              duration: 600.ms,
              begin: const Offset(0, 70),
              end: const Offset(0, 0),
            ),
          ],
        ),
        'containerOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 800.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 800.ms,
              duration: 600.ms,
              begin: 0,
              end: 1,
            ),
            MoveEffect(
              curve: Curves.easeInOut,
              delay: 800.ms,
              duration: 600.ms,
              begin: const Offset(0, 50),
              end: const Offset(0, 0),
            ),
          ],
        ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(100, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 180.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: const Offset(20, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(40, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(120, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 220.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 220.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 220.ms,
          duration: 600.ms,
          begin: const Offset(20, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 240.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: const Offset(40, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(120, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 220.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 220.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 220.ms,
          duration: 600.ms,
          begin: const Offset(20, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 240.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: const Offset(40, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(100, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 180.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: const Offset(20, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(40, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 600.ms,
          begin: const Offset(0, 70),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    retrieveCallLogs();
    retrieveAndClassifyCallLogs();
    _model = createModel(context, () => DashboardModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Text(
                            'Dashboard',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 35,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20,
                            buttonSize: 58,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.account_circle_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfileWidget()));
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            children: [
                              wrapWithModel(
                                model: _model.cardCallModel4,
                                updateCallback: () => setState(() {}),
                                child: CardCallWidget( cardTitle: 'Total Calls',
                                  cardValue: totalcalls,
                                  cardIcon: const Icon(Icons.add_ic_call,color: Colors.white,),),
                              ),
                              wrapWithModel(
                                model: _model.cardCallModel1,
                                updateCallback: () => setState(() {}),
                                child: CardCallWidget(cardTitle: 'Incoming Calls',
                                  cardValue: incomingCalls,
                                  cardIcon: const Icon(Icons.call_received,color: Colors.white),                           ),
                              ),
                              wrapWithModel(
                                model: _model.cardCallModel2,
                                updateCallback: () => setState(() {}),
                                child: CardCallWidget(
                                  cardTitle: 'Outgoing Calls',
                                  cardValue: outgoingCalls,
                                  cardIcon: const Icon(Icons.call_made,color: Colors.white,),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.cardCallModel3,
                                updateCallback: () => setState(() {}),
                                child: CardCallWidget( cardTitle: 'Missed Calls',
                                  cardValue: missedCalls,
                                  cardIcon: const Icon(Icons.call_missed,color: Colors.white,),),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                  child: Text(
                    'Current Score',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 12, 10, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(
                            0.0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      constraints: const BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              1,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SingleChildScrollView(
                                    child:Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Call History',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        Text(
                                          'A list of historical transactions',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4)),
                                    ),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(
                                height: 2,
                                thickness: 2,
                                color: MyTheme.of(context).alternate,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      // Set a specific height for the ListView to limit its height in the SingleChildScrollView
                                      height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
                                      child: ListView.builder(
                                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                                        scrollDirection: Axis.vertical,
                                        itemCount: _callLogs.length,
                                        itemBuilder: (context, index) {
                                          var call = _callLogs[index];
                                          return Container(
                                            width: 100,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: MyTheme.of(context).secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color: MyTheme.of(context).alternate,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 32,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      color: MyTheme.of(context).primaryBackground,
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(
                                                        color: MyTheme.of(context).alternate,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0, 0),
                                                      child: Icon(
                                                        Icons.attach_money_rounded,
                                                        color: MyTheme.of(context).secondaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            call.name ?? 'Unknown',
                                                            textAlign: TextAlign.end,
                                                            style: MyTheme.of(context).bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0, 4, 0, 0),
                                                            child: Text(
                                                              'Number ${call.number ?? '**** 2192'}',
                                                              style: MyTheme.of(context).labelMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      // .animateOnPageLoad(
                      // animationsMap['textOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 12, 10, 0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      minHeight: 300,
                      maxHeight: 500,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(
                            0.0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                    // Generated code for this Column Widget...
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                            child: Text(
                              'Recent Activity',
                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                            child: Text(
                              'Below is an overview of tasks & activity completed.',
                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 350,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                              xData: [
                                                1.0,
                                                2.0,
                                                3.0,
                                                4.0,
                                                5.0
                                              ], // Replace with actual x-axis data
                                              yData: [20.0, 25.0, 30.0, 35.0, 40.0],
                                    settings: LineChartBarData(
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      barWidth: 2,
                                      isCurved: true,
                                      preventCurveOverShooting: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: FlutterFlowTheme.of(context).accent1,
                                      ),
                                    ),
                                  )
                                ],

                                axisBounds: const AxisBounds(),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Last 30 Days',
                                  titleTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                  ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: 'Messeges Sent',
                                  titleTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Container(
                    decoration: const BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
//
  }

  Future<void> retrieveAndClassifyCallLogs() async {
    try {
      // Request permission to access call logs
      var permissionStatus = await Permission.phone.request();
      if (permissionStatus != PermissionStatus.granted) {
        print('Permission to access call logs not granted');
        return;
      }

      // Retrieve call logs
      Iterable<CallLogEntry> callLogs = await CallLog.get();

      // Initialize counters for each call type

      // Classify and count calls based on type
      for (var call in callLogs) {
        switch (call.callType) {
          case CallType.incoming:
            incomingCalls++;
            break;
          case CallType.outgoing:
            outgoingCalls++;
            break;
          case CallType.missed:
            missedCalls++;
            break;
          default:
            break;
        }
      }

      // Output the counts
      totalcalls = incomingCalls + outgoingCalls + missedCalls;
      print(totalcalls);
      print('Incoming calls: $incomingCalls');
      print('Outgoing calls: $outgoingCalls');
      print('Missed calls: $missedCalls');
    } catch (e) {
      print('Error retrieving call logs: $e');
    }
  }

    List<CallLogEntry> _callLogs = [];

    Future<void> retrieveCallLogs() async {
      if (await Permission.phone.request().isGranted) {
        var callLogs = await CallLog.get();
        setState(() {
          _callLogs = callLogs.take(10).toList(); // Limit to top 10 call logs
        });
      }
    }

  String getMessageForCallType(CallType? callType) {
    if (callType == null) {
      return 'Unknown call type';
    }

    switch (callType) {
      case CallType.incoming:
        print('Incoming call');
        return 'incoming';
      case CallType.outgoing:
        print('Outgoing call');
        return 'outgoing';
      case CallType.missed:
        print('Missed call');
        return 'missed';
      case CallType.rejected:
        print('Rejected call');
        return 'rejected';
      case CallType.blocked:
        print('Blocked call');
        return 'blocked';
      default:
        return 'Unknown call type';
    }
  }
}
