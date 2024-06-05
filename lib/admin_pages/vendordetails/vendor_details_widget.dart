import 'package:app/main.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '/admin_pages/components/edit_subscription/edit_subscription_widget.dart';
import 'package:mock_data/mock_data.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'vendor_details_model.dart';
export 'vendor_details_model.dart';

class VendorDetailsWidget extends StatefulWidget {
  const VendorDetailsWidget({super.key});

  @override
  State<VendorDetailsWidget> createState() => _VendorDetailsWidgetState();
}

class _VendorDetailsWidgetState extends State<VendorDetailsWidget>
    with TickerProviderStateMixin {
  late VendorDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorDetailsModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String vendorId = ModalRoute.of(context)!.settings.arguments as String ;
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                // context.pushNamed('Profile');
              },
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack (
            children: [
              Consumer<VendorsListProvider> (
                builder: (context, model, child) {
                  Map<String, dynamic> details = model.getVendor(vendorId) as Map<String, dynamic>;
                  if(details.isNotEmpty){
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                  child: Text(
                                    'Vendor Details',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 32,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  1, 1, 1, 1),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder: 'assets/placeholder_image.jpg',
                                                  image: details["Profile"]["imageFile"] ??
                                                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                                  width: 150,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                  fadeInDuration: const Duration(milliseconds: 500),
                                                  fadeOutDuration: const Duration(milliseconds: 500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24, 10, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Vendor Name',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Profile"]["vendorName"]?? '[Vendor name]',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Email',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Profile"]["vendorEmail"]?? '[xyz@gmail.com]',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Phone',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Profile"]["vendorContact"]?? '[1234567890]',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Business Name',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Profile"]["businessName"]?? '[Business name]',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Business Description',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Profile"]["businessDescription"]?? '[Description]',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Notification',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Notification"]?["Enabled"] ?? 'Not Set',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(
                                      animationsMap['listViewOnPageLoadAnimation']!),
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                  child: Text(
                                    'Website',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 22,
                                  thickness: 0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 24, 12),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        width: 2,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              16, 12, 16, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      0, 0, 12, 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Domain Name',
                                                        style:
                                                        FlutterFlowTheme.of(context)
                                                            .bodyLarge
                                                            .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 4, 0, 0),
                                                        child: Text(
                                                          details["webDomain"] ?? 'Website not created!',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .labelMedium
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () async {
                                                  var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text('Web Domain'),
                                                        content: const Text(
                                                            'Do you want to delete Vendors Website Information ?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: const Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                            const Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ?? false;
                                                  debugPrint('Delete Domain Response: $confirmDialogResponse');
                                                  if(confirmDialogResponse) {
                                                    setState(() {
                                                      _loading = true;
                                                    });
                                                    await _model.deleteWebSite(vendorId);
                                                    setState(() {
                                                      _loading = false;
                                                    });
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  color: FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                  child: Text(
                                    'Active Subscriptions',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(-1, -1),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 8),
                                          child: Text(
                                            'Subscription Details',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 25,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 22,
                                        thickness: 0,
                                        color: FlutterFlowTheme.of(context).alternate,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24, 10, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Subscription Type',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Subscription"]?["type"]?? 'Inactive',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Start Date',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Subscription"]?["start"] ?? 'Inactive',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                              FlutterFlowTheme.of(context).alternate,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                16, 12, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 12, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'End Date',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional
                                                              .fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            details["Subscription"]?["end"] ?? 'Inactive',
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .override(
                                                              fontFamily: 'Inter',
                                                              fontSize: 18,
                                                              letterSpacing: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              16, 12, 16, 15),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding: EdgeInsets.zero,
                                                    backgroundColor: Colors.transparent,
                                                    alignment: const AlignmentDirectional(0, 0)
                                                        .resolve(
                                                        Directionality.of(context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                          .unfocusNode.canRequestFocus
                                                          ? FocusScope.of(context)
                                                          .requestFocus(
                                                          _model.unfocusNode)
                                                          : FocusScope.of(context)
                                                          .unfocus(),
                                                      child: SizedBox(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        child: EditSubscriptionWidget(
                                                          id: vendorId,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => setState(() {}));
                                            },
                                            text: 'Edit Subscription',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48,
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                              color: FlutterFlowTheme.of(context).primary,
                                              textStyle: FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: Colors.white,
                                                letterSpacing: 0,
                                              ),
                                              elevation: 3,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 15),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            var confirmDialogResponse = await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Delete Vendor'),
                                                  content: const Text(
                                                      'Do you want to delete Vendor Information?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ?? false;
                                            debugPrint('Delete Vendor Response: $confirmDialogResponse');
                                            if(confirmDialogResponse) {
                                              setState(() {
                                                _loading = true;
                                              });
                                              await _model.deleteVendor(vendorId);
                                              navigator.currentState!.pop();
                                              // setState(() {
                                              //   _loading = false;
                                              // });
                                            }

                                          },
                                          text: 'Delete Vendor',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                24, 0, 24, 0),
                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            color: const Color(0xFFFB1014),
                                            textStyle: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0,
                                            ),
                                            elevation: 3,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 22,
                                  thickness: 0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    debugPrint("Details not found");
                    navigator.currentState!.pop();
                    return Container();
                  }
                },
              ),
              if (_loading)
                Positioned.fill(
                  child: Container(
                    color: Colors.grey.withOpacity(0.8), // Grey background with opacity
                    child: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ),
                ),
            ],
          )
          // child: Column(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: SingleChildScrollView(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.max,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
          //               child: Text(
          //                 'Vendor Details',
          //                 style: FlutterFlowTheme.of(context)
          //                     .displaySmall
          //                     .override(
          //                   fontFamily: 'Readex Pro',
          //                   letterSpacing: 0,
          //                 ),
          //               ),
          //             ),
          //             Divider(
          //               height: 32,
          //               thickness: 1,
          //               color: FlutterFlowTheme.of(context).alternate,
          //             ),
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
          //               child: ListView(
          //                 padding: EdgeInsets.zero,
          //                 primary: false,
          //                 shrinkWrap: true,
          //                 scrollDirection: Axis.vertical,
          //                 children: [
          //                   Container(
          //                     width: 100,
          //                     height: 100,
          //                     decoration: BoxDecoration(
          //                       color: FlutterFlowTheme.of(context)
          //                           .secondaryBackground,
          //                     ),
          //                     child: Row(
          //                       mainAxisSize: MainAxisSize.max,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsetsDirectional.fromSTEB(
          //                               155, 1, 1, 1),
          //                           child: ClipRRect(
          //                             borderRadius: BorderRadius.circular(6),
          //                             child: Image.network(
          //                               'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
          //                               width: 93,
          //                               height: 91,
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsetsDirectional.fromSTEB(
          //                         24, 10, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Vendor Name',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         '[Vendor name]',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Email',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         '[xyz@gmail.com]',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Phone',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         '[1234567890]',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Business Name',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         '[Business name]',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Business Description',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         '[Description]',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Notification',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         'Enabled',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ).animateOnPageLoad(
          //                   animationsMap['listViewOnPageLoadAnimation']!),
          //             ),
          //             Divider(
          //               thickness: 2,
          //               indent: 10,
          //               endIndent: 10,
          //               color: FlutterFlowTheme.of(context).primaryText,
          //             ),
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
          //               child: Text(
          //                 'Website',
          //                 style: FlutterFlowTheme.of(context)
          //                     .displaySmall
          //                     .override(
          //                   fontFamily: 'Readex Pro',
          //                   letterSpacing: 0,
          //                 ),
          //               ),
          //             ),
          //             Divider(
          //               height: 22,
          //               thickness: 0,
          //               color: FlutterFlowTheme.of(context).alternate,
          //             ),
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 24, 12),
          //               child: Container(
          //                 width: double.infinity,
          //                 constraints: const BoxConstraints(
          //                   maxWidth: 570,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   color: FlutterFlowTheme.of(context)
          //                       .secondaryBackground,
          //                   borderRadius: BorderRadius.circular(8),
          //                   border: Border.all(
          //                     color: FlutterFlowTheme.of(context).alternate,
          //                     width: 2,
          //                   ),
          //                 ),
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.max,
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsetsDirectional.fromSTEB(
          //                           16, 12, 16, 12),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         mainAxisAlignment:
          //                         MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Expanded(
          //                             child: Padding(
          //                               padding: const EdgeInsetsDirectional.fromSTEB(
          //                                   0, 0, 12, 0),
          //                               child: Column(
          //                                 mainAxisSize: MainAxisSize.max,
          //                                 mainAxisAlignment:
          //                                 MainAxisAlignment.center,
          //                                 crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     'Domain Name',
          //                                     style:
          //                                     FlutterFlowTheme.of(context)
          //                                         .bodyLarge
          //                                         .override(
          //                                       fontFamily: 'Inter',
          //                                       fontSize: 14,
          //                                       letterSpacing: 0,
          //                                     ),
          //                                   ),
          //                                   Padding(
          //                                     padding: const EdgeInsetsDirectional
          //                                         .fromSTEB(0, 4, 0, 0),
          //                                     child: Text(
          //                                       'xyz',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .labelMedium
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 18,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                           InkWell(
          //                             splashColor: Colors.transparent,
          //                             focusColor: Colors.transparent,
          //                             hoverColor: Colors.transparent,
          //                             highlightColor: Colors.transparent,
          //                             onTap: () async {
          //                               var confirmDialogResponse = await showDialog<bool>(
          //                                     context: context,
          //                                     builder: (alertDialogContext) {
          //                                       return AlertDialog(
          //                                         title: const Text('Web Domain'),
          //                                         content: const Text(
          //                                             'Do you want to delete Vendors Website Information ?'),
          //                                         actions: [
          //                                           TextButton(
          //                                             onPressed: () =>
          //                                                 Navigator.pop(
          //                                                     alertDialogContext,
          //                                                     false),
          //                                             child: const Text('Cancel'),
          //                                           ),
          //                                           TextButton(
          //                                             onPressed: () =>
          //                                                 Navigator.pop(
          //                                                     alertDialogContext,
          //                                                     true),
          //                                             child:
          //                                             const Text('Confirm'),
          //                                           ),
          //                                         ],
          //                                       );
          //                                     },
          //                                   ) ?? false;
          //                               debugPrint('Delete Domain Response: $confirmDialogResponse');
          //                             },
          //                             child: Icon(
          //                               Icons.delete_forever,
          //                               color: FlutterFlowTheme.of(context)
          //                                   .secondaryText,
          //                               size: 24,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Divider(
          //               thickness: 2,
          //               indent: 10,
          //               endIndent: 10,
          //               color: FlutterFlowTheme.of(context).primaryText,
          //             ),
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
          //               child: Text(
          //                 'Active Subscriptions',
          //                 style: FlutterFlowTheme.of(context)
          //                     .displaySmall
          //                     .override(
          //                   fontFamily: 'Readex Pro',
          //                   letterSpacing: 0,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.max,
          //                 children: [
          //                   Align(
          //                     alignment: const AlignmentDirectional(-1, -1),
          //                     child: Padding(
          //                       padding:
          //                       const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 8),
          //                       child: Text(
          //                         'Subscription Details',
          //                         textAlign: TextAlign.start,
          //                         style: FlutterFlowTheme.of(context)
          //                             .bodyLarge
          //                             .override(
          //                           fontFamily: 'Inter',
          //                           fontSize: 25,
          //                           letterSpacing: 0,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Divider(
          //                     height: 22,
          //                     thickness: 0,
          //                     color: FlutterFlowTheme.of(context).alternate,
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsetsDirectional.fromSTEB(
          //                         24, 10, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Subscription Type',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         'Premium',
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'Start Date',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         random_data
          //                                             .mockDate()
          //                                             .toString(),
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
          //                     child: Container(
          //                       width: double.infinity,
          //                       constraints: const BoxConstraints(
          //                         maxWidth: 570,
          //                       ),
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .secondaryBackground,
          //                         borderRadius: BorderRadius.circular(8),
          //                         border: Border.all(
          //                           color:
          //                           FlutterFlowTheme.of(context).alternate,
          //                           width: 2,
          //                         ),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             16, 12, 16, 12),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Expanded(
          //                               child: Padding(
          //                                 padding:
          //                                 const EdgeInsetsDirectional.fromSTEB(
          //                                     0, 0, 12, 0),
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.max,
          //                                   mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       'End Date',
          //                                       style:
          //                                       FlutterFlowTheme.of(context)
          //                                           .bodyLarge
          //                                           .override(
          //                                         fontFamily: 'Inter',
          //                                         fontSize: 14,
          //                                         letterSpacing: 0,
          //                                       ),
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsetsDirectional
          //                                           .fromSTEB(0, 4, 0, 0),
          //                                       child: Text(
          //                                         random_data
          //                                             .mockDate()
          //                                             .toString(),
          //                                         style: FlutterFlowTheme.of(
          //                                             context)
          //                                             .labelMedium
          //                                             .override(
          //                                           fontFamily: 'Inter',
          //                                           fontSize: 18,
          //                                           letterSpacing: 0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Builder(
          //                     builder: (context) => Padding(
          //                       padding: const EdgeInsetsDirectional.fromSTEB(
          //                           16, 12, 16, 15),
          //                       child: FFButtonWidget(
          //                         onPressed: () async {
          //                           await showDialog(
          //                             context: context,
          //                             builder: (dialogContext) {
          //                               return Dialog(
          //                                 elevation: 0,
          //                                 insetPadding: EdgeInsets.zero,
          //                                 backgroundColor: Colors.transparent,
          //                                 alignment: const AlignmentDirectional(0, 0)
          //                                     .resolve(
          //                                     Directionality.of(context)),
          //                                 child: GestureDetector(
          //                                   onTap: () => _model
          //                                       .unfocusNode.canRequestFocus
          //                                       ? FocusScope.of(context)
          //                                       .requestFocus(
          //                                       _model.unfocusNode)
          //                                       : FocusScope.of(context)
          //                                       .unfocus(),
          //                                   child: SizedBox(
          //                                     height: double.infinity,
          //                                     width: double.infinity,
          //                                     child: EditSubscriptionWidget(
          //                                       id: args,
          //                                     ),
          //                                   ),
          //                                 ),
          //                               );
          //                             },
          //                           ).then((value) => setState(() {}));
          //                         },
          //                         text: 'Edit Subscription',
          //                         options: FFButtonOptions(
          //                           width: double.infinity,
          //                           height: 48,
          //                           padding: const EdgeInsetsDirectional.fromSTEB(
          //                               24, 0, 24, 0),
          //                           iconPadding: const EdgeInsetsDirectional.fromSTEB(
          //                               0, 0, 0, 0),
          //                           color: FlutterFlowTheme.of(context).primary,
          //                           textStyle: FlutterFlowTheme.of(context)
          //                               .titleSmall
          //                               .override(
          //                             fontFamily: 'Inter',
          //                             color: Colors.white,
          //                             letterSpacing: 0,
          //                           ),
          //                           elevation: 3,
          //                           borderSide: const BorderSide(
          //                             color: Colors.transparent,
          //                             width: 1,
          //                           ),
          //                           borderRadius: BorderRadius.circular(8),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsetsDirectional.fromSTEB(
          //                         16, 12, 16, 15),
          //                     child: FFButtonWidget(
          //                       onPressed: () async {
          //                         var confirmDialogResponse = await showDialog<bool>(
          //                               context: context,
          //                               builder: (alertDialogContext) {
          //                                 return AlertDialog(
          //                                   title: const Text('Delete Vendor'),
          //                                   content: const Text(
          //                                       'Do you want to delete Vendor Information?'),
          //                                   actions: [
          //                                     TextButton(
          //                                       onPressed: () =>
          //                                           Navigator.pop(
          //                                               alertDialogContext,
          //                                               false),
          //                                       child: const Text('Cancel'),
          //                                     ),
          //                                     TextButton(
          //                                       onPressed: () =>
          //                                           Navigator.pop(
          //                                               alertDialogContext,
          //                                               true),
          //                                       child: const Text('Confirm'),
          //                                     ),
          //                                   ],
          //                                 );
          //                               },
          //                             ) ?? false;
          //                         debugPrint('Delete Vendor Response: $confirmDialogResponse');
          //                       },
          //                       text: 'Delete Vendor',
          //                       options: FFButtonOptions(
          //                         width: double.infinity,
          //                         height: 48,
          //                         padding: const EdgeInsetsDirectional.fromSTEB(
          //                             24, 0, 24, 0),
          //                         iconPadding: const EdgeInsetsDirectional.fromSTEB(
          //                             0, 0, 0, 0),
          //                         color: const Color(0xFFFB1014),
          //                         textStyle: FlutterFlowTheme.of(context)
          //                             .titleSmall
          //                             .override(
          //                           fontFamily: 'Inter',
          //                           color: Colors.white,
          //                           letterSpacing: 0,
          //                         ),
          //                         elevation: 3,
          //                         borderSide: const BorderSide(
          //                           color: Colors.transparent,
          //                           width: 1,
          //                         ),
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             Divider(
          //               height: 22,
          //               thickness: 0,
          //               color: FlutterFlowTheme.of(context).alternate,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
