import 'package:call_info/pages/call_logs_widget.dart';
import 'package:call_info/pages/dashborad_page_widget.dart';
import 'package:call_info/pages/settings_page_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Info',
      // home: DashboradPageWidget(),
      initialRoute: '/vendor_dashboard',
      routes: {
        '/vendor_dashboard': (context) => const DashboradPageWidget(),
        '/vendor_settings': (context) => const SettingsPageWidget(),
        '/vendor_logs': (context) => const CallLogsWidget(),
        // '/splash': (context) => const SplashScreen(),
        // '/login': (context) => const LoginPhone(),
      },
    );
    // return const SafeArea(
    //     child: DashboradPageWidget(),
    // );
  }
}
