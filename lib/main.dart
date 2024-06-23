import 'dart:async';
import 'dart:developer' as developer;

import 'package:app/admin_pages/login/login_widget.dart';
import 'package:app/admin_pages/home/home_page_widget.dart';
import 'package:app/admin_pages/profile/admin_profile_widget.dart';
import 'package:app/admin_pages/splashscreen/splash_screen_widget.dart';
import 'package:app/admin_pages/vendordetails/vendor_details_widget.dart';
import 'package:app/admin_pages/vendorslist/vendor_list_widget.dart';
import 'package:app/firebase_options.dart';
import 'package:app/handlers/check_connection_stream.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


late final FirebaseApp app;
final navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  //Widgets Initializations.
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Initialize
  await Firebase.initializeApp();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_print
    debugPrint('Connectivity changed: $_connectionStatus');
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log("Couldn't check connectivity status", error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VendorsListProvider()),
      ],
      child: GetMaterialApp(
        title: 'Call Info Admin',
        initialRoute: RouteKeys.splash,
        // initialRoute: RouteKeys.homePage,
        routes: appRoutes,
        navigatorKey: navigator,
        initialBinding: InitialBindings()
      ),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckConnectionStream());
  }
}

var appRoutes = {
  RouteKeys.splash : (context) => const SplashScreenWidget(),
  RouteKeys.homePage : (context) => const HomePageWidget(),
  RouteKeys.profile : (context) => const AdminProfileWidget(),
  RouteKeys.login : (context) => const LoginWidget(),
  RouteKeys.vendorList : (context)=> const VendorListWidget(),
  RouteKeys.vendorDetails : (context) => const VendorDetailsWidget(),
};

class RouteKeys {
  static const String splash = '/splashScreen';
  static const String homePage = '/homePage';
  static const String profile = '/profile';
  static const String login = "/login";
  static const String vendorList= '/vendorsList';
  static const String vendorDetails= '/vendorsDetails';

}