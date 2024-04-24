
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/handlers/call_handler.dart';
import 'package:call_info/handlers/permission_manager.dart';
import 'package:call_info/pages/callLogs/calllogs_widget.dart';
import 'package:call_info/pages/customerSupport/customer_support_widget.dart';
import 'package:call_info/pages/dashboard/DashboardUi.dart';
import 'package:call_info/pages/editProfile/edit_profile_widget.dart';
import 'package:call_info/pages/faqPage/faq_widget.dart';
import 'package:call_info/pages/loginPage/login_page_widget.dart';
import 'package:call_info/pages/loginPage/otp_screen_widget.dart';
import 'package:call_info/pages/messageTemplate/CustomTemplate.dart';
import 'package:call_info/pages/messageTemplate/SMSmessagetemplate.dart';
import 'package:call_info/pages/permissionsPage/permission_widget.dart';
import 'package:call_info/pages/splashScreen/splash_screen_widget.dart';
import 'package:call_info/pages/subscriptionPage/vendorSubscriptionWidget.dart';
import 'package:call_info/pages/vendorProfile/profile_widget.dart';
import 'package:call_info/pages/webEditor/ImageGallery/webImageGallerywidegt.dart';
import 'package:call_info/pages/webEditor/Products/AddProduct/webAddProductsWidget.dart';
import 'package:call_info/pages/webEditor/Products/saveProductInfo/webSaveProductPageWidget.dart';
import 'package:call_info/pages/webEditor/testimonialPage/webTestimonailWidget.dart';
import 'package:call_info/pages/webEditor/weHelp/webWeHelpPagewidget.dart';
import 'package:call_info/pages/webEditor/webServices/webServicesWidget.dart';
import 'package:call_info/pages/webEditor/websiteDashboard/web_page_editor_widget.dart';
import 'package:call_info/pages/webEditor/LinkPage/LinkWidget.dart';
import 'package:call_info/pages/webEditor/VideoGallery/webVideoGallery.dart';
import 'package:call_info/pages/webEditor/metaData/webMetadatawidget.dart';
import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:call_info/providers/sms/sms_provider.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/messageTemplate/whatsappmessagetemplate.dart';


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
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
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
    FirebaseAuthHandler(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SMSMessageTemplateProvider()),
        ChangeNotifierProvider(create: (_) => WPMessageTemplateProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()), // Provide the ProfileProvider

      ],
      child: MaterialApp(
        title: 'Call Info',
        initialRoute: routeKeys.splashScreen,
        // initialRoute: routeKeys.activeSubscriptionPage,
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
      ),
    );
  }
}
var appRoutes = {
  routeKeys.splashScreen : (context) => SplashScreenWidget(),
  routeKeys.vendorDashboard : (context) => DashboardWidget(),
  routeKeys.vendorSMSTemplate : (context) => SMSTemplateWidget(),
  routeKeys.vendorWPTemplate : (context) => WhatsappTemplateWidget(),
  routeKeys.vendorLogin : (context) => LoginPageWidget(),
  routeKeys.vendorOtp : (context) => OTPScreenWidget(),
  // routeKeys.callLogTemplate : (context) => CalllogsWidget(),
  routeKeys.callLogTemplate : (context) => CallLogsPage(),
  routeKeys.editVendorProfile : (context) => EditProfileWidget(),
  routeKeys.settingsPage : (context) => SettingsWidget(),
  routeKeys.faqPage : (context) => FaqWidget(),
  routeKeys.customerSupport : (context) => CustomerSupportWidget(),
  routeKeys.customTemplates : (context) => CustomtemplateWidget(),
  routeKeys.permissionsPage : (context) => PermissionWidget(),
  routeKeys.activeSubscriptionPage : (context) => ActiveSubscriptionWidget(),
  routeKeys.webPageEditorDashboard : (context) => WebPageEditorWidget(),
  routeKeys.linkPage : (context) => LinksPageWidget(),
  routeKeys.webMetadataPage : (context) => WebMetadataPageWidget(),
  routeKeys.webVideoGallery : (context) => WebVideoGalleryWidget(),


  routeKeys.webImageGallery : (context) => WebImageGalleyWidget(),
  routeKeys.webServicesPage : (context) => WeServicesPageWidget(),
  routeKeys.webAddProductPage : (context) => WebAddProductPageWidget(),
  routeKeys.webSaveProductPage : (context) => WebSaveProductWidget(),
  routeKeys.webWeHelpPage : (context) => WeHelpPageWidget(),
  routeKeys.webTestimonialPage : (context) => WebTestimonialPageWidget(),

};

class routeKeys {
  static const String splashScreen = '/splash';
  static const String vendorDashboard = '/vendor_dashboard';
  static const String vendorSMSTemplate = '/vendor_SMSTemplate';
  static const String vendorWPTemplate = '/vendor_WPTemplate';
  static const String vendorLogin = '/vendor_login';
  static const String vendorOtp = '/vendor_otp';
  static const String callLogTemplate = '/call_LogTemplate';
  static const String editVendorProfile = '/edit_Vendor_Profile';
  static const String settingsPage= '/settingsPage';
  static const String faqPage= '/faqPage';
  static const String customerSupport= '/customerSupport';
  static const String customTemplates= '/customTemplates';
  static const String permissionsPage= '/permissionsPage';
  static const String activeSubscriptionPage= '/activeSubscriptionPage';
  static const String webEditor = '/webEditor';

  static const String webPageEditorDashboard= '/webPageEditorDashboard';
  static const String linkPage= '/linkPage';
  static const String webMetadataPage= '/webMetadataPage';
  static const String webVideoGallery= '/wevVideoGalley';


  static const String webImageGallery= '/webImageGalley';
  static const String webServicesPage= '/webServicesPage';
  static const String webAddProductPage= '/webAddProductPage';
  static const String webSaveProductPage= '/webSaveProductPage';
  static const String webWeHelpPage= '/webWeHelpPage';
  static const String webTestimonialPage= '/webTestimonialPage';




}