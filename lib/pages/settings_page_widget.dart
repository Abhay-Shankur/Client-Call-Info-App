import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/pages/components/setting_page_list_item/setting_page_list_item_widget.dart';
import '/pages/pages/components/social_media_icon/social_media_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'settings_page_model.dart';
export 'settings_page_model.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  late SettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: MyTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            // context.safePop();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Setting Page',
          style: MyTheme.of(context).headlineMedium.override(
            fontFamily: 'Readex Pro',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.settingPageListItemModel1,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'My Subscription',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel2,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Call logs',
                        itemAction: () async {
                          Navigator.of(context).pushNamed('/vendor_logs');
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel3,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Manage Permissions',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel4,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Custom Templates',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel5,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Getting Started',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel6,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'About Us',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel7,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Help',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel8,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Privacy Policy',
                        itemAction: () async {},
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingPageListItemModel9,
                      updateCallback: () => setState(() {}),
                      child: SettingPageListItemWidget(
                        itemName: 'Terms & Conditions',
                        itemAction: () async {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 8),
                  child: Text(
                    'Follow us on',
                    style: MyTheme.of(context).labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.socialMediaIconModel1,
                        updateCallback: () => setState(() {}),
                        child: SocialMediaIconWidget(
                          iconName: FaIcon(
                            FontAwesomeIcons.youtube,
                          ),
                          iconAction: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.socialMediaIconModel2,
                        updateCallback: () => setState(() {}),
                        child: SocialMediaIconWidget(
                          iconName: FaIcon(
                            FontAwesomeIcons.youtube,
                          ),
                          iconAction: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.socialMediaIconModel3,
                        updateCallback: () => setState(() {}),
                        child: SocialMediaIconWidget(
                          iconName: FaIcon(
                            FontAwesomeIcons.youtube,
                          ),
                          iconAction: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.socialMediaIconModel4,
                        updateCallback: () => setState(() {}),
                        child: SocialMediaIconWidget(
                          iconName: FaIcon(
                            FontAwesomeIcons.youtube,
                          ),
                          iconAction: () async {},
                        ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'App Versions',
                    style: MyTheme.of(context).titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                  child: Text(
                    'v0.0.1',
                    style: MyTheme.of(context).labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Log Out',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: MyTheme.of(context).error,
                      textStyle: MyTheme.of(context)
                          .labelMedium
                          .override(
                        fontFamily: 'Inter',
                        color: MyTheme.of(context).primaryBtnText,
                      ),
                      elevation: 16,
                      borderSide: BorderSide(
                        color: MyTheme.of(context).secondaryText,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 0)).addToEnd(SizedBox(height: 20)),
            ),
          ),
        ),
      ),
    );
  }
}
