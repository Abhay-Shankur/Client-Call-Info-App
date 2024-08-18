import 'package:call_info/theme/my_theme.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:toastification/toastification.dart';

import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>{
  late LoginPageModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [
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
    _model = createModel(context, () => LoginPageModel());

    _model.mobileNumberController ??= TextEditingController();
    _model.mobileNumberFocusNode ??= FocusNode();

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
      child: Stack(
        children: [
          Scaffold(
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
                                size: 34,
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
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back',
                                  textAlign: TextAlign.center,
                                  style: MyTheme.of(context).displaySmall,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 24),
                                  child: Text(
                                    'Fill out the information below in order to access your account.',
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
                                      controller: _model.mobileNumberController,
                                      focusNode: _model.mobileNumberFocusNode,
                                      maxLength: 10,
                                      autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.telephoneNumber
                                      ],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle:
                                        MyTheme.of(context).labelLarge,
                                        hintText: 'Mobile Number',
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
                                      keyboardType: TextInputType.phone,
                                      cursorColor:
                                      MyTheme.of(context).primary,
                                      validator: _model
                                          .mobileNumberControllerValidator
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
                                      // Perform backend work
                                      if(await _model.checkPhone()) {
                                        if(context.mounted) {
                                          await _model.sendOtp(context);
                                        }
                                      } else {
                                        setState(() {
                                          _saving = false;
                                        });
                                        if(context.mounted) {
                                          showToast(
                                            context: context,
                                            type: ToastificationType.warning,
                                            title: "Authentication",
                                            desc: "Vendor not Registered!"
                                          );
                                        }
                                      }

                                      // After work is done, set loading state to false
                                      // setState(() {
                                      //   _saving = false;
                                      // });
                                      // await _performBackendWork();
                                      // setState(() {
                                      //   _saving = true;
                                      // });
                                      // await _model.sendOtp();
                                      // setState(() {
                                      //   _saving = false;
                                      // });
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(builder: (context) => OTPScreenWidget())
                                      //   );
                                    },
                                    // onPressed: _model.sendOtp(),
                                    text: 'Send OTP',
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

  //
  // // Function to perform backend work
  // Future<bool> _performBackendWork() async {
  //   // Set loading state to true
  //   setState(() {
  //     _saving = true;
  //   });
  //   // Perform backend work
  //   await _model.sendOtp(context);
  //
  //   // After work is done, set loading state to false
  //   setState(() {
  //     _saving = false;
  //   });
  //   return true;
  // }
}
