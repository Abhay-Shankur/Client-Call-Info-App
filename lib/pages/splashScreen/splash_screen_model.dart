import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/main.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'splash_screen_widget.dart' show SplashScreenWidget;
import 'package:flutter/material.dart';

class SplashScreenModel extends FlutterFlowModel<SplashScreenWidget> {
  ///  State fields for stateful widgets in this page.
  BuildContext? modelContext;
  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
      pageViewController!.hasClients &&
      pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    modelContext = context;
    _isLoggedIn();
  }

  Future<void> _isLoggedIn() async {
    if(await FirebaseAuthHandler(context: navigator.currentState!.context).checkLoginStatus()) {
      navigator.currentState!.pushNamedAndRemoveUntil(routeKeys.vendorDashboard, (route) => false);
    }
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

/// Action blocks are added here.
  Future<bool> getLoginStatus() async {
    bool res = await FirebaseAuthHandler(context: navigator.currentState!.context).checkLoginStatus();
    return res;
  }
/// Additional helper methods are added here.
}
