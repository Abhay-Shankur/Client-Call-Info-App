
import 'package:call_info/handlers/call_handler.dart';
import 'package:call_info/handlers/firebase_firestore.dart';
import 'package:call_info/handlers/permission_manager.dart';
import 'package:call_info/pages/dashboard/DashboardUi.dart';
import 'package:call_info/pages/splashScreen/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


late final FirebaseApp app;
final navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  //Widgets Initializations.
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Initialize
  // await Firebase.initializeApp();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Call Handler
  CallHandler.setupCallHandler();
  // CallHandler.setupCallHandler((callType) {
  //   debugPrint('Received call type: $callType');
  //   // Update UI or perform any other actions based on call type
  // });

  //Crashlytics
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  //
  // //Push Notifications
  // await FirebaseMessagingHandler().initNotifications();

  // Check and request storage permissions
  await PermissionManager.requestAll();

  runApp(const MyApp());
}

// void backgroundTask() {
//   const MethodChannel backgroundChannel = MethodChannel('com.callinfo.application.call_info/callType');
//   backgroundChannel.setMethodCallHandler((call) async {
//     if (call.method == 'triggerBackgroundTask') {
//       // Code to trigger the BroadcastReceiver and send call type to Flutter
//       // You can implement this logic here or call another function
//       backgroundChannel.invokeMethod('receiveCallType', 'Incoming');
//     }
//   });
// }


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Info',
      initialRoute: routeKeys.vendorDashboard,
      routes: appRoutes,
      navigatorKey: navigator,
      // initialRoute: '/vendor_login',
      // routes: {
      //   '/vendor_dashboard': (context) => const DashboradPageWidget(),
      //   '/vendor_settings': (context) => const SettingsPageWidget(),
      //   // '/vendor_logs': (context) => const CallLogsWidget(),
      //   '/vendor_logs': (context) => const CalllogsWidget(),
      //   '/vendor_faq': (context) => const FaqWidget(),
      //   '/vendor_support': (context) => const CustomerSupportWidget(),
      //   '/vendor_permission': (context) => const PermissionWidget(),
      //   '/vendor_editProfile': (context) => const EditProfileWidget(),
      //   '/vendor_profile': (context) => const ProfileWidget(),
      //   '/vendor_otp': (context) => const OTPScreenWidget(),
      //   '/vendor_login': (context) => const LoginPageWidget(),
      //   '/splash': (context) => const SplashScreenWidget(),
      //   // '/login': (context) => const LoginPhone(),
      // },
    );
  }
}
var appRoutes = {
  routeKeys.splashScreen : (context) => SplashScreenWidget(),
  routeKeys.vendorDashboard : (context) => DashboardUi(),
};

class routeKeys {
  static const String splashScreen = '/splash';
  static const String vendorDashboard = '/vendor_dashboard';
  // static const String splashScreen = '/splash';
  // static const String splashScreen = '/splash';
  // static const String splashScreen = '/splash';
  // static const String splashScreen = '/splash';
  // static const String splashScreen = '/splash';
}