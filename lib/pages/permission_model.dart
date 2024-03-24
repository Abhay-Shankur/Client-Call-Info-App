import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/permission_list_item/permission_list_item_widget.dart';
import 'permission_widget.dart' show PermissionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PermissionModel extends FlutterFlowModel<PermissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PermissionListItem component.
  late PermissionListItemModel permissionListItemModel1;
  // Model for PermissionListItem component.
  late PermissionListItemModel permissionListItemModel2;
  // Model for PermissionListItem component.
  late PermissionListItemModel permissionListItemModel3;
  // Model for PermissionListItem component.
  late PermissionListItemModel permissionListItemModel4;
  // Model for PermissionListItem component.
  late PermissionListItemModel permissionListItemModel5;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    permissionListItemModel1 =
        createModel(context, () => PermissionListItemModel());
    permissionListItemModel2 =
        createModel(context, () => PermissionListItemModel());
    permissionListItemModel3 =
        createModel(context, () => PermissionListItemModel());
    permissionListItemModel4 =
        createModel(context, () => PermissionListItemModel());
    permissionListItemModel5 =
        createModel(context, () => PermissionListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    permissionListItemModel1.dispose();
    permissionListItemModel2.dispose();
    permissionListItemModel3.dispose();
    permissionListItemModel4.dispose();
    permissionListItemModel5.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
