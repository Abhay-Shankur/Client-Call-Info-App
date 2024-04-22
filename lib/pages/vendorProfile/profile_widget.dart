// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/main.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutter/material.dart';
import '../professionalTemplate/professionalttemplate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late Profile08Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Profile08Model());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: MyTheme.of(context).secondaryText,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 140,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: MyTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: GestureDetector(
                                          onTap: () {
                                            navigator.currentState?.pushNamed(routeKeys.editVendorProfile);
                                          },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            'assets/vendor.jpg',
                                            width: double.infinity,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigator.currentState?.pushNamed(routeKeys.editVendorProfile);
                                      },
                                    child: ClipOval(
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: MyTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: MyTheme.of(context)
                                                .secondaryText,
                                            width: 4,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: GestureDetector(
                                            onTap: () {
                                              navigator.currentState?.pushNamed(routeKeys.editVendorProfile);
                                            },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'assets/batch.jpg'
                                                  : 'assets/batch.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ))],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                            child: Text(
                              'Nikhil Jain',
                              textAlign: TextAlign.center,
                              style: MyTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: MyTheme.of(context).info,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                            child: GestureDetector(
                              onTap: () {

                                navigator.currentState?.pushNamed(routeKeys.activeSubscriptionPage);
                              },
                                        child: Container(
                                          width: 34,
                                          height: 34,
                                          decoration: BoxDecoration(
                                            color: MyTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: GestureDetector(
                                            onTap: () {

                                              navigator.currentState?.pushNamed(routeKeys.activeSubscriptionPage);
                                            },
                                            child: Icon(
                                              Icons.work_outline,
                                              color:
                                                  MyTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ),
                                      Text(
                                        'Active \nSubscription',
                                        textAlign: TextAlign.center,
                                        style: MyTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Container(
                                            width: 34,
                                            height: 34,
                                            decoration: BoxDecoration(
                                              color:
                                                  MyTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: GestureDetector(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           DashboardUi()),
                                                // );
                                                navigator.currentState?.pushNamed(routeKeys.vendorDashboard);
                                              },
                                              child: Icon(
                                                Icons.notifications_outlined,
                                                color:
                                                    MyTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Activity \noversights',
                                          textAlign: TextAlign.center,
                                          style: MyTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: Container(
                                          width: 34,
                                          height: 34,
                                          decoration: BoxDecoration(
                                            color: MyTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context, routeKeys.faqPage);
                                            },
                                            child: Icon(
                                              Icons.help_outline_outlined,
                                              color:
                                                  MyTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Help Center',
                                        textAlign: TextAlign.center,
                                        style: MyTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    color: MyTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, -1),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Text(
                              'Settings',
                              style: MyTheme.of(context).headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, routeKeys.callLogTemplate);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.history_outlined,
                                      color: MyTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Call Logs',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, routeKeys.permissionsPage);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.edit,
                                      color: MyTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Manage Permissions',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, routeKeys.customTemplates);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.terminal,
                                      color: MyTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Custom Template',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PromossionalmsgtempWidget()),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.adobe_rounded,
                                      color: MyTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Promotional Messages ',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            // child:
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(builder: (context) => ()),
                            //     );
                            //   },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 8),
                                  child: Icon(
                                    Icons.adobe_rounded,
                                    color: MyTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: Text(
                                      'WebPage Editor',
                                      textAlign: TextAlign.start,
                                      style: MyTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, routeKeys.customerSupport);
                                    },
                                    child: Icon(
                                      Icons.groups_3,
                                      color: MyTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, routeKeys.customerSupport);
                                      },
                                      child: Text(
                                        'Customer Support',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 8),
                                  child: Icon(
                                    Icons.privacy_tip_outlined,
                                    color: MyTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: Text(
                                      'Privacy Policy',
                                      textAlign: TextAlign.start,
                                      style: MyTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 8),
                                  child: Icon(
                                    Icons.login_rounded,
                                    color: MyTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        FirebaseAuthHandler(
                                          context: navigator.currentState!.context
                                        ).signOut(() {
                                          SharedPreferencesHelper.removeAll();
                                          navigator.currentState!.pushNamedAndRemoveUntil(routeKeys.splashScreen, (route) => false);
                                        });
                                      },
                                      child: Text(
                                        'Log out of account',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Log Out?',
                                  textAlign: TextAlign.center,
                                  style: MyTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: MyTheme.of(context)
                                            .primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
