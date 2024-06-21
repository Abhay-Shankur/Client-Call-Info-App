
import 'dart:async';
import 'dart:developer' as developer;

import 'package:call_info/handlers/call_handler.dart';
import 'package:call_info/handlers/check_connection_stream.dart';
import 'package:call_info/pages/blocklistPage/blocked_list_widget.dart';
import 'package:call_info/pages/callLogs/call_logs_widget.dart';
import 'package:call_info/pages/customerSupport/customer_support_widget.dart';
import 'package:call_info/pages/dashboard/dashboard_widget.dart';
import 'package:call_info/pages/editProfile/edit_profile_widget.dart';
import 'package:call_info/pages/faqPage/faq_widget.dart';
import 'package:call_info/pages/loginPage/login_page_widget.dart';
import 'package:call_info/pages/loginPage/otp_screen_widget.dart';
import 'package:call_info/pages/messageTemplate/custom_template_widget.dart';
import 'package:call_info/pages/messageTemplate/sms_template_widget.dart';
import 'package:call_info/pages/messageTemplate/whatsapp_template_widget.dart';
import 'package:call_info/pages/permissionsPage/permission_widget.dart';
import 'package:call_info/pages/promotionalTemplate/promotional_template_widget.dart';
import 'package:call_info/pages/splashScreen/splash_screen_widget.dart';
import 'package:call_info/pages/subscriptionPage/subscription_page_widget.dart';
import 'package:call_info/pages/vendorProfile/profile_widget.dart';
import 'package:call_info/pages/webEditor/ImageGallery/web_image_galley_widget.dart';
import 'package:call_info/pages/webEditor/Products/AddProduct/web_product_page_widget.dart';
import 'package:call_info/pages/webEditor/Products/saveProductInfo/web_product_add_widget.dart';
import 'package:call_info/pages/webEditor/testimonialPage/web_testimonial_add_widget.dart';
import 'package:call_info/pages/webEditor/testimonialPage/web_testimonial_page_widget.dart';
import 'package:call_info/pages/webEditor/weHelp/we_help_page_widget.dart';
import 'package:call_info/pages/webEditor/webServices/web_servic_page_widget.dart';
import 'package:call_info/pages/webEditor/webServices/web_service_add_widget.dart';
import 'package:call_info/pages/webEditor/websiteDashboard/web_page_editor_widget.dart';
import 'package:call_info/pages/webEditor/LinkPage/LinkWidget.dart';
import 'package:call_info/pages/webEditor/VideoGallery/web_video_gallery_widget.dart';
import 'package:call_info/pages/webEditor/metaData/webMetadatawidget.dart';
import 'package:call_info/providers/blocklist/blocklist_provider.dart';
import 'package:call_info/providers/permissions/permissions_provider.dart';
import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:call_info/providers/sms/sms_provider.dart';
import 'package:call_info/providers/subscription/subscription_provider.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/gallery/photo_gallery_provider.dart';
import 'package:call_info/providers/webEditor/gallery/video_gallery_provider.dart';
import 'package:call_info/providers/webEditor/links/links_provider.dart';
import 'package:call_info/providers/webEditor/metadata/metadata_provider.dart';
import 'package:call_info/providers/webEditor/products/product_provider.dart';
import 'package:call_info/providers/webEditor/reviews/reviews_provider.dart';
import 'package:call_info/providers/webEditor/services/services_provider.dart';
import 'package:call_info/providers/webEditor/weHelpTo/wehelp_provider.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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

  // // Crashlytics
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  // //Push Notifications
  // await FirebaseMessagingHandler().initNotifications();


  // PermissionManager.requestAll();

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
    print('Connectivity changed: $_connectionStatus');
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
      developer.log('Couldn\'t check connectivity status', error: e);
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

  // Future<void> _init() async {
  //   // Check and request storage permissions
  //   await PermissionManager.requestAll();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => SMSMessageTemplateProvider()),
        // ChangeNotifierProvider(create: (_) => WPMessageTemplateProvider()),
        ChangeNotifierProvider(create: (context) => PermissionsProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SMSProvider()),
        ChangeNotifierProvider(create: (context) => WPProvider()),
        ChangeNotifierProvider(create: (context) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => BlocklistProvider()),

        ChangeNotifierProvider(create: (context) => WebDomainProvider()),
        ChangeNotifierProvider(create: (context) => WebMetaDataProvider()),
        ChangeNotifierProvider(create: (context) => WebProductsProvider()),
        ChangeNotifierProvider(create: (context) => WebPhotoGalleryProvider()),
        ChangeNotifierProvider(create: (context) => WebVideoGalleryProvider()),
        ChangeNotifierProvider(create: (context) => WebServicesProvider()),
        ChangeNotifierProvider(create: (context) => WebWeHelpProvider()),
        ChangeNotifierProvider(create: (context) => WebReviewsProvider()),
        ChangeNotifierProvider(create: (context) => WebLinksProvider()),

      ],
      child: GetMaterialApp(
        title: 'Call Info',
        initialRoute: RouteKeys.splashScreen,
        // initialRoute: routeKeys.webPageEditorDashboard,
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
  RouteKeys.splashScreen : (context) => const SplashScreenWidget(),
  RouteKeys.vendorDashboard : (context) => const DashboardWidget(),
  RouteKeys.vendorSMSTemplate : (context) => const SMSTemplateWidget(),
  RouteKeys.vendorWPTemplate : (context) => const WhatsappTemplateWidget(),
  RouteKeys.vendorPromoTemplate : (context) => const PromotionalTemplateWidget(),
  RouteKeys.vendorLogin : (context) => const LoginPageWidget(),
  RouteKeys.vendorOtp : (context) => const OTPScreenWidget(),
  RouteKeys.callLogTemplate : (context) => const CallLogsPage(),
  RouteKeys.editVendorProfile : (context) => const EditProfileWidget(),
  RouteKeys.settingsPage : (context) => const SettingsWidget(),
  RouteKeys.faqPage : (context) => const FaqWidget(),
  RouteKeys.customerSupport : (context) => const CustomerSupportWidget(),
  RouteKeys.customTemplates : (context) => const CustomtemplateWidget(),
  RouteKeys.permissionsPage : (context) => const PermissionWidget(),
  RouteKeys.activeSubscriptionPage : (context) => const SubscriptionPageWidget(),
  RouteKeys.blocklistPage : (context) => const BlockedListWidget(),

  RouteKeys.webPageEditorDashboard : (context) => const WebPageEditorWidget(),
  RouteKeys.linkPage : (context) => const LinksPageWidget(),
  RouteKeys.webMetadataPage : (context) => const WebMetadataPageWidget(),
  RouteKeys.webVideoGallery : (context) => const WebVideoGalleryWidget(),
  RouteKeys.webImageGallery : (context) => const WebImageGalleyWidget(),
  RouteKeys.webServicesPage : (context) => const WebServicPageWidget(),
  RouteKeys.webServicesAdd : (context) => const WebServiceAddWidget(),
  RouteKeys.webProductsPage : (context) => const WebProductsPageWidget(),
  RouteKeys.webProductsAdd : (context) => const WebProductsAddWidget(),
  RouteKeys.webWeHelpPage : (context) => const WeHelpPageWidget(),
  RouteKeys.webTestimonialPage : (context) => const WebTestimonialPageWidget(),
  RouteKeys.webTestimonialAdd : (context) => const WebTestimonialAddWidget(),

};

class RouteKeys {
  static const String splashScreen = '/splash';
  static const String vendorDashboard = '/vendor_dashboard';
  static const String vendorSMSTemplate = '/vendor_SMSTemplate';
  static const String vendorWPTemplate = '/vendor_WPTemplate';
  static const String vendorPromoTemplate = '/vendor_PromoTemplate';
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
  static const String blocklistPage= '/blocklistPage';

  static const String webPageEditorDashboard= '/webPageEditorDashboard';
  static const String linkPage= '/linkPage';
  static const String webMetadataPage= '/webMetadataPage';
  static const String webVideoGallery= '/wevVideoGalley';
  static const String webImageGallery= '/webImageGalley';
  static const String webServicesPage= '/webServicesPage';
  static const String webServicesAdd= '/webServicesAdd';
  static const String webProductsPage= '/webProductPage';
  static const String webProductsAdd= '/webProductAdd';
  static const String webWeHelpPage= '/webWeHelpPage';
  static const String webTestimonialPage= '/webTestimonialPage';
  static const String webTestimonialAdd= '/webTestimonialAdd';




}