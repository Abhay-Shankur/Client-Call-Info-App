import 'package:call_info/theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:call_info/main.dart';
import 'Dashboardmodel.dart';
export 'Dashboardmodel.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashborddemoCopyWidgetState();
}

class _DashborddemoCopyWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashborddemoCopyModel _model;
  int incomingCalls = 0;
  int outgoingCalls = 0;
  int totalcalls = 0;
  int missedCalls = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
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
          begin: Offset(100, 0),
          end: Offset(0, 0),
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
          begin: Offset(0.8, 0.8),
          end: Offset(1, 1),
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
          begin: Offset(20, 0),
          end: Offset(0, 0),
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
          begin: Offset(40, 0),
          end: Offset(0, 0),
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
          begin: Offset(120, 0),
          end: Offset(0, 0),
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
          begin: Offset(0.8, 0.8),
          end: Offset(1, 1),
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
          begin: Offset(20, 0),
          end: Offset(0, 0),
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
          begin: Offset(40, 0),
          end: Offset(0, 0),
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
          begin: Offset(120, 0),
          end: Offset(0, 0),
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
          begin: Offset(0.8, 0.8),
          end: Offset(1, 1),
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
          begin: Offset(20, 0),
          end: Offset(0, 0),
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
          begin: Offset(40, 0),
          end: Offset(0, 0),
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
          begin: Offset(100, 0),
          end: Offset(0, 0),
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
          begin: Offset(0.8, 0.8),
          end: Offset(1, 1),
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
          begin: Offset(20, 0),
          end: Offset(0, 0),
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
          begin: Offset(40, 0),
          end: Offset(0, 0),
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
          begin: Offset(0, 30),
          end: Offset(0, 0),
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
          begin: Offset(0, 70),
          end: Offset(0, 0),
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
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashborddemoCopyModel());
    retrieveAndClassifyCallLogs();
    totalcalls=incomingCalls+outgoingCalls+missedCalls;
    retrieveCallLogs();

//
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        backgroundColor: MyTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Text(
                            'Dashboard',
                            textAlign: TextAlign.center,
                            style: MyTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      MyTheme.of(context).primaryText,
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: FlutterFlowIconButton(
                            borderColor: MyTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20,
                            fillColor: MyTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.account_circle_outlined,
                              color: MyTheme.of(context).primaryText,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, routeKeys.settingsPage);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 160,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: MyTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1F000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: MyTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: MyTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: MyTheme.of(context)
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.add_ic_call,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Calls',
                                              style: MyTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: MyTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation1']!),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '$totalcalls',
                                                style:
                                                    MyTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: MyTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1F000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: MyTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: MyTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: MyTheme.of(context)
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.call_made,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation4']!),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Outgoing Calls',
                                              style: MyTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: MyTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation3']!),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '$outgoingCalls',
                                                style:
                                                    MyTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation4']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: MyTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1F000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: MyTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: MyTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: MyTheme.of(context)
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.call_missed,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation6']!),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Missed Calls ',
                                              style: MyTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: MyTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation5']!),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '$missedCalls',
                                                style:
                                                    MyTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation6']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation5']!),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: MyTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1F000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: MyTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: MyTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: MyTheme.of(context)
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.call_received,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation8']!),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Incoming Calls',
                                              style: MyTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: MyTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation7']!),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '$incomingCalls',
                                                style:
                                                    MyTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation8']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation7']!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                  child: Text(
                    'Current Score',
                    textAlign: TextAlign.start,
                    style: MyTheme.of(context).titleLarge,
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation9']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: MyTheme.of(context).primaryBackground,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 400,
                      constraints: BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: MyTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x33000000),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: MyTheme.of(context).alternate,
                          width: 1,
                        ),
                      ),
                      child: // Generated code for this main_column Widget...
                          Padding(
                        padding: EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Call History',
                                          textAlign: TextAlign.end,
                                          style: MyTheme.of(context)
                                              .titleLarge,
                                        ),
                                        Text(
                                          'A list of historical transactions',
                                          style: MyTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ].divide(SizedBox(height: 4)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('All'),
                                    ChipData('Incoming '),
                                    ChipData('Outgoing '),
                                    ChipData('Missed')
                                  ],
                                  onChanged: (val) => setState(() => _model
                                      .choiceChipsValue = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        MyTheme.of(context).accent1,
                                    textStyle: MyTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: MyTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    iconColor: MyTheme.of(context)
                                        .primaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderColor:
                                        MyTheme.of(context).primary,
                                    borderWidth: 2,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        MyTheme.of(context).alternate,
                                    textStyle: MyTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: MyTheme.of(context)
                                              .secondaryText,
                                        ),
                                    iconColor: MyTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderColor:
                                        MyTheme.of(context).alternate,
                                    borderWidth: 2,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  chipSpacing: 8,
                                  rowSpacing: 8,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    ['All'],
                                  ),
                                  // wrapped: false,
                                ),
                              ),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: MyTheme.of(context).alternate,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ListView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        12,
                                        0,
                                        12,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: _callLogs
                                          .length, // Use the length of call logs list
                                      itemBuilder: (context, index) {
                                        var call = _callLogs[index];
                                        return Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: MyTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0,
                                                color:
                                                    MyTheme.of(context)
                                                        .alternate,
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: MyTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color:
                                                          MyTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .attach_money_rounded,
                                                      color:
                                                          MyTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          call.name ??
                                                              'Unknown',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: MyTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            'Number ${call.number ?? '**** 2192'}',
                                                            style: MyTheme
                                                                    .of(context)
                                                                .labelMedium,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation9']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 300,
                      maxHeight: 500,
                    ),
                    decoration: BoxDecoration(
                      color: MyTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                            child: Text(
                              'Recent Activity',
                              style: MyTheme.of(context).headlineSmall,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                            child: Text(
                              'Below is an overview of tasks & activity completed.',
                              style: MyTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                            child: Container(
                              width: double.infinity,
                              height: 300,
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
                                        color: Color(0xFF1A1A1C),
                                      barWidth: 2,
                                      isCurved: true,
                                      preventCurveOverShooting: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: MyTheme.of(context)
                                            .accent1,
                                      ),
                                    ),
                                  ),
                                  FFLineChartData(
                                    xData: [
                                      1.0,
                                      2.0,
                                      3.0,
                                      4.0,
                                      5.0
                                    ], // Replace with actual x-axis data
                                    yData: [10.0, 20.0, 15.0, 25.0, 30.0],
                                    settings: LineChartBarData(
                                      color: Color(0xFF4B39EF),
                                      barWidth: 2,
                                      isCurved: true,
                                      preventCurveOverShooting: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: MyTheme.of(context)
                                            .accent3,
                                      ),
                                    ),
                                  )
                                ],
                                // chartStylingInfo: ChartStylingInfo(
                                //   backgroundColor:
                                //   MyTheme.of(context).primaryText,
                                //   showBorder: false,
                                // ),
                                axisBounds: AxisBounds(),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Last 30 Days',
                                  titleTextStyle: MyTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20,
                                      ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: 'Avg. Grade',
                                  titleTextStyle:
                                      MyTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxHeight: 32,
                                      ),
                                      decoration: BoxDecoration(
                                        color: MyTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.radio_button_checked_sharp,
                                              color:
                                                  MyTheme.of(context)
                                                      .primary,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                'Incoming',
                                                style:
                                                    MyTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxHeight: 32,
                                      ),
                                      decoration: BoxDecoration(
                                        color: MyTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.radio_button_checked_sharp,
                                              color:
                                                  MyTheme.of(context)
                                                      .secondary,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                'Outgoing',
                                                style:
                                                    MyTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxHeight: 32,
                                      ),
                                      decoration: BoxDecoration(
                                        color: MyTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.radio_button_checked_sharp,
                                              color:
                                                  MyTheme.of(context)
                                                      .tertiary,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                'Missed',
                                                style:
                                                    MyTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18,
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
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation10']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> retrieveAndClassifyCallLogs() async {
//
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
      totalcalls=incomingCalls+outgoingCalls+missedCalls;
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
        _callLogs = callLogs.take(4).toList(); // Limit to top 10 call logs
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
