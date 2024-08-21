import 'package:app/firebaseHandlers/firebase_auth.dart';
import 'package:app/main.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:app/theme/my_theme.dart';

import 'admin_profile_model.dart';
export 'admin_profile_model.dart';

class AdminProfileWidget extends StatefulWidget {
  const AdminProfileWidget({super.key});

  @override
  State<AdminProfileWidget> createState() => _AdminProfileWidgetState();
}

class _AdminProfileWidgetState extends State<AdminProfileWidget>
    with TickerProviderStateMixin {
  late AdminProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminProfileModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () =>[
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
        backgroundColor: AppTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: AppTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.close_rounded,
                color: AppTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                navigator.currentState!.pop();
              },
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).accent1,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.of(context).primary,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/adminImage.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      'Hello Admin',
                      style:
                      AppTheme.of(context).headlineSmall.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation1']!),
                  ),
                  Divider(
                    height: 44,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: AppTheme.of(context).alternate,
                  ).animateOnPageLoad(
                      animationsMap['dividerOnPageLoadAnimation']!),
                  Consumer<VendorsListProvider>(
                      builder: (_, value, child) {
                        int count = value.vendors.length;
                        return Text(
                          count.toString(),
                          style: AppTheme.of(context).displayMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!);
                      }
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                    child: Text(
                      'Total Vendors',
                      style: AppTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: AppTheme.of(context).secondaryText,
                        letterSpacing: 0,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation3']!),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              //   child: Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: AppTheme.of(context).secondaryBackground,
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: AppTheme.of(context).alternate,
              //         width: 2,
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
              //       child: Row(
              //         mainAxisSize: MainAxisSize.max,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              //             child: Icon(
              //               Icons.settings_outlined,
              //               color: AppTheme.of(context).primaryText,
              //               size: 24,
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              //             child: Text(
              //               'Account Settings',
              //               style:
              //               AppTheme.of(context).bodyLarge.override(
              //                 fontFamily: 'Inter',
              //                 letterSpacing: 0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ).animateOnPageLoad(
              //       animationsMap['containerOnPageLoadAnimation2']!),
              // ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: FFButtonWidget(
                  onPressed: () async {
                    //TODO: Logout
                    await FirebaseAuthHandler(context: context)
                        .signOut(
                            () async {
                              navigator.currentState!.pushNamedAndRemoveUntil(RouteKeys.splash, (route) => false);
                            }
                        );
                  },
                  text: 'Log Out',
                  options: FFButtonOptions(
                    width: 150,
                    height: 50,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: AppTheme.of(context).primaryBackground,
                    textStyle: AppTheme.of(context).bodyLarge.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0,
                    ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: AppTheme.of(context).alternate,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(38),
                  ),
                ).animateOnPageLoad(
                    animationsMap['buttonOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
