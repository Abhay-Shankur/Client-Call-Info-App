import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/pages/components/setting_page_list_item/setting_page_list_item_widget.dart';
import '/pages/pages/components/social_media_icon/social_media_icon_widget.dart';
import 'settings_page_widget.dart' show SettingsPageWidget;
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel<SettingsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel1;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel2;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel3;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel4;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel5;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel6;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel7;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel8;
  // Model for SettingPageListItem component.
  late SettingPageListItemModel settingPageListItemModel9;
  // Model for SocialMediaIcon component.
  late SocialMediaIconModel socialMediaIconModel1;
  // Model for SocialMediaIcon component.
  late SocialMediaIconModel socialMediaIconModel2;
  // Model for SocialMediaIcon component.
  late SocialMediaIconModel socialMediaIconModel3;
  // Model for SocialMediaIcon component.
  late SocialMediaIconModel socialMediaIconModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    settingPageListItemModel1 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel2 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel3 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel4 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel5 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel6 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel7 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel8 =
        createModel(context, () => SettingPageListItemModel());
    settingPageListItemModel9 =
        createModel(context, () => SettingPageListItemModel());
    socialMediaIconModel1 = createModel(context, () => SocialMediaIconModel());
    socialMediaIconModel2 = createModel(context, () => SocialMediaIconModel());
    socialMediaIconModel3 = createModel(context, () => SocialMediaIconModel());
    socialMediaIconModel4 = createModel(context, () => SocialMediaIconModel());
  }

  @override
  void dispose() {
    settingPageListItemModel1.dispose();
    settingPageListItemModel2.dispose();
    settingPageListItemModel3.dispose();
    settingPageListItemModel4.dispose();
    settingPageListItemModel5.dispose();
    settingPageListItemModel6.dispose();
    settingPageListItemModel7.dispose();
    settingPageListItemModel8.dispose();
    settingPageListItemModel9.dispose();
    socialMediaIconModel1.dispose();
    socialMediaIconModel2.dispose();
    socialMediaIconModel3.dispose();
    socialMediaIconModel4.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
