
import 'package:app/admin_pages/vendordetails/vendor_details_widget.dart';
import 'package:app/admin_pages/vendorslist/vendor_list_widget.dart';
import 'package:app/firebase_options.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VendorsListProvider()),
      ],
      child: MaterialApp(
        title: 'Call Info Admin',
        // initialRoute: routeKeys.splashScreen,
        initialRoute: RouteKeys.vendorList,
        routes: appRoutes,
        navigatorKey: navigator,
      ),
    );
  }
}

var appRoutes = {
  RouteKeys.vendorList : (context)=> const VendorListWidget(),
  RouteKeys.vendorDetails : (context) => const VendorDetailsWidget(),
  // RouteKeys.vendorSubscription : (context) => EditSubscriptionWidget(),
};

class RouteKeys {
  static const String vendorList= '/vendorsList';
  static const String vendorDetails= '/vendorsDetails';
  // static const String vendorSubscription= '/vendorSubscription';

}