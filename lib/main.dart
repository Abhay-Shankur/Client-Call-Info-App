
import 'package:call_info/handlers/service_locator.dart';
import 'package:call_info/pages/dashboard/dashboard_widget.dart';
import 'package:call_info/pages/splashScreen/splash_screen_widget.dart';
import 'package:call_log/call_log.dart';
import 'package:call_info/handlers/background_tasks.dart';
import 'package:flutter/material.dart';
import 'pages/profile/profile_widget.dart';
import 'package:flutter/services.dart';
import 'pages/editProfile/edit_profile_widget.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

///TOP-LEVEL FUNCTION PROVIDED FOR WORK MANAGER AS CALLBACK
void callbackDispatcher() {
  Workmanager().executeTask((dynamic task, dynamic inputData) async {
    print('Background Services are Working!');
    try {
      final Iterable<CallLogEntry> cLog = await CallLog.get();
      print('Queried call log entries');
      for (CallLogEntry entry in cLog) {
        print('-------------------------------------');
        print('F. NUMBER  : ${entry.formattedNumber}');
        print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
        print('NUMBER     : ${entry.number}');
        print('NAME       : ${entry.name}');
        print('TYPE       : ${entry.callType}');
        print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}');
        print('DURATION   : ${entry.duration}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('SIM NAME   : ${entry.simDisplayName}');
        print('-------------------------------------');
      }
      return true;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return true;
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final _noScreenshot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    // disableSS();
  }

  Future<void> disableSS() async {
    // final result = await _noScreenshot.screenshotOff();
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Info',
      home : DashboardWidget(),
      // initialRoute: '/vendor_dashboard',
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
