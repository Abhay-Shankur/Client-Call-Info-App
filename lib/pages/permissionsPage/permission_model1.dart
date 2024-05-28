import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/permission_list_item/permission_list_item_widget.dart';
import 'permission_widget1.dart' show PermissionWidget;
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
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

// Location permission: android.permission.ACCESS_FINE_LOCATION

  Future<bool> checkLocationPermissionStatus() async {
    PermissionStatus status = await Permission.location.status;
    return status.isGranted;
  }

// Camera permission: android.permission.CAMERA
  Future<bool> checkCameraPermissionStatus() async {
    PermissionStatus status = await Permission.camera.status;
    return status.isGranted;
  }

// Storage permission: android.permission.READ_EXTERNAL_STORAGE or android.permission.WRITE_EXTERNAL_STORAGE
  Future<bool> checkStoragePermissionStatus() async {
    PermissionStatus readStatus = await Permission.storage.status;
    PermissionStatus writeStatus = await Permission.manageExternalStorage.status;
    return readStatus.isGranted || writeStatus.isGranted;
  }

// Microphone permission: android.permission.RECORD_AUDIO
  Future<bool> checkMicrophonePermissionStatus() async {
    PermissionStatus status = await Permission.microphone.status;
    return status.isGranted;
  }

// Contacts permission: android.permission.READ_CONTACTS
  Future<bool> checkContactsPermissionStatus() async {
    PermissionStatus status = await Permission.contacts.status;
    return status.isGranted;
  }

}
