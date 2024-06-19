
import 'package:call_info/main.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'otp_screen_model.dart';
export 'otp_screen_model.dart';

class OTPScreenWidget extends StatefulWidget {
  const OTPScreenWidget({super.key});

  @override
  State<OTPScreenWidget> createState() => _OTPScreenWidgetState();
}

class _OTPScreenWidgetState extends State<OTPScreenWidget>
    with TickerProviderStateMixin {
  late OTPScreenModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0, 140),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPScreenModel());

    _model.otpController ??= TextEditingController();
    _model.otpFocusNode ??= FocusNode();

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
        backgroundColor: MyTheme.of(context).secondaryBackground,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyTheme.of(context).secondaryText,
                MyTheme.of(context).accent1
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0.87, -1),
              end: const AlignmentDirectional(-0.87, 1),
            ),
          ),
          alignment: const AlignmentDirectional(0, -1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                          child: Icon(
                            Icons.flourescent_rounded,
                            color: MyTheme.of(context).info,
                            size: 44,
                          ),
                        ),
                        Text(
                          'Call Info',
                          style: MyTheme.of(context)
                              .displaySmall
                              .override(
                            fontFamily: 'Readex Pro',
                            color: MyTheme.of(context).info,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 570,
                    ),
                    decoration: BoxDecoration(
                      color: MyTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(32, 20, 32, 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: MyTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 12,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: MyTheme.of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    navigator.currentState!.pop();
                                    // context.safePop();
                                  },
                                ),
                              ].divide(const SizedBox(width: 12)),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                'Enter OTP',
                                textAlign: TextAlign.center,
                                style:
                                MyTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 24),
                              child: Text(
                                'Please fill out 6 digit OTP received on your  entered mobile number',
                                textAlign: TextAlign.start,
                                style: MyTheme.of(context).labelLarge,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.otpController,
                                  focusNode: _model.otpFocusNode,
                                  maxLength: 6,
                                  autofocus: true,
                                  autofillHints: const [AutofillHints.oneTimeCode],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                    MyTheme.of(context).labelLarge,
                                    hintText: 'OTP',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context)
                                            .alternate,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyTheme.of(context)
                                            .primary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        MyTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        MyTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: MyTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  style: MyTheme.of(context).bodyLarge,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                  MyTheme.of(context).primary,
                                  validator: _model.otpControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _saving = true;
                                  });
                                  await _model.verifyOtp(context);
                                  setState(() {
                                    _saving = false;
                                  });
                                  // navigator.currentState?.pushNamed(routeKeys.vendorDashboard);
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: MyTheme.of(context).primary,
                                  textStyle: MyTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}