import 'dart:async';

import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/handlers/check_connection_stream.dart';
import 'package:call_info/handlers/permission_manager.dart';
import 'package:call_info/main.dart' as main;
import 'package:call_info/main.dart';
import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 3200.ms,
          begin: const Offset(0, -80),
          end: const Offset(0, 0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 3200.ms,
          duration: 3200.ms,
          begin: const Offset(0, 0),
          end: const Offset(0, -80),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _requestPermissions();
    });

    // _isLoggedIn();
    // _init();
  }

  Future<void> _requestPermissions() async {
    if(mounted) {
       PermissionManager.requestAll();
    }
  }

  // Completer<bool>? _completer;
  //
  // Future<bool> _initializeProviders(BuildContext context) async {
  //   if (_completer == null) {
  //     _completer = Completer<bool>();
  //     await _initProviders(context);
  //   }
  //   return _completer!.future;
  // }
  //
  // Future<void> _initProviders(BuildContext context) async {
  //   try {
  //     if(context.mounted){
  //       final isLogin = await FirebaseAuthHandler(context: context).checkLoginStatus();
  //       final status = isLogin &&
  //           await Provider.of<ProfileProvider>(context, listen: false).initialize() &&
  //           await Provider.of<SMSProvider>(context, listen: false).initialize() &&
  //           await Provider.of<WPProvider>(context, listen: false).initialize() &&
  //           await Provider.of<SubscriptionProvider>(context, listen: false).initialize();
  //       _completer!.complete(status);
  //     }
  //   } catch (e) {
  //     debugPrint("Exception: $e");
  //     _completer!.complete(false);
  //   }
  // }

  Future<bool?> _initializeProviders() async {
    try {
      // await _requestPermissions();
      final isLogin = await FirebaseAuthHandler(context: main.navigator.currentState!.context).checkLoginStatus();
      if(isLogin) {
        final status = await Provider.of<ProfileProvider>(context, listen: false).initialize();
        return status;
      } else {
        return null;
      }
    } catch (e){
      debugPrint("Exception: $e");
      return false;
    }
  }

  // void _init() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await Future.delayed(const Duration(milliseconds: 500)); // Delay to ensure Activity is ready
  //     await PermissionManager.requestAll();
  //   });
  // }

  // Future<void> _isLoggedIn() async {
  //   if(await FirebaseAuthHandler(context: navigator.currentState!.context).checkLoginStatus()) {
  //     navigator.currentState!.pushNamedAndRemoveUntil(routeKeys.vendorDashboard, (route) => false);
  //   }
  // }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final CheckConnectionStream connectionStream = Get.find();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: FutureBuilder(
        future: _initializeProviders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Error Please Try Again.'),
              ),
            );
          } else if (snapshot.data == false) {
            return const Scaffold(
              body: Center(
                child: Text('Error loading Content.'),
              ),
            );
          } else if ((snapshot.connectionState == ConnectionState.done) && snapshot.data == true) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              navigate();
            });
            return const Scaffold();
          } else {
            return getScreen();
          }
        },
      ),
    );
  }

  Future<void> navigate() async{
    main.navigator.currentState!.pushNamedAndRemoveUntil(RouteKeys.vendorDashboard, (route) => false);
  }

  Scaffold getScreen() {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            child: Container(
              width: double.infinity,
              height: 420,
              decoration: BoxDecoration(
                color: MyTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: MyTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/logoVendor.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                      // .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Container(
                width: double.infinity,
                height: 400,
                constraints: const BoxConstraints(
                  // maxWidth: 600,
                ),
                decoration: BoxDecoration(
                  color: MyTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      48, 0, 48, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Call Info',
                                        textAlign: TextAlign.center,
                                        style: MyTheme.of(context)
                                            .displaySmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Text(
                                          'Start Your Journey from today',
                                          textAlign: TextAlign.center,
                                          style: MyTheme.of(context)
                                              .labelLarge,
                                        ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      48, 0, 48, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'CALL INFO',
                                        textAlign: TextAlign.center,
                                        style: MyTheme.of(context)
                                            .displaySmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation3']!),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Text(
                                          'I have some great food options here!! Yum yum!!',
                                          textAlign: TextAlign.center,
                                          style: MyTheme.of(context)
                                              .labelLarge,
                                        ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation4']!),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      48, 0, 48, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Personalized call discovery',
                                        textAlign: TextAlign.center,
                                        style: MyTheme.of(context)
                                            .displaySmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation5']!),
                                      const Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        //   child: Text(
                                        //     'I have some great food options here!! Yum yum!!',
                                        //     textAlign: TextAlign.center,
                                        //     style: MyTheme.of(context)
                                        //         .labelLarge,
                                        //   ).animateOnPageLoad(animationsMap[
                                        //   'textOnPageLoadAnimation6']!),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child:
                              smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  dotColor:
                                  MyTheme.of(context).alternate,
                                  activeDotColor: MyTheme.of(context)
                                      .primaryText,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<bool>(
                      future: _model.getLoginStatus(),
                      builder: (context, AsyncSnapshot<bool> snapshot) {
                        if(snapshot.connectionState == ConnectionState.done) {
                          final isLoggedIn = snapshot.data ?? false;
                          return Visibility(
                            visible: !(isLoggedIn),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  main.navigator.currentState!.pushReplacementNamed(RouteKeys.vendorLogin);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => LoginPageWidget()),
                                  // );
                                },
                                text: 'Next',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: MyTheme.of(context).primaryText,
                                  textStyle: MyTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: MyTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  elevation: 1,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  hoverColor:
                                  MyTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Placeholder widget or empty container while waiting for the future to complete
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
