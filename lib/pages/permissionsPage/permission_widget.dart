
import 'package:call_info/pages/vendorProfile/profile_widget.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/permission_list_item/permission_list_item_widget.dart';
import 'package:flutter/material.dart';

import 'permission_model.dart';
export 'permission_model.dart';

class PermissionWidget extends StatefulWidget {
  const PermissionWidget({super.key});

  @override
  State<PermissionWidget> createState() => _PermissionWidgetState();
}

class _PermissionWidgetState extends State<PermissionWidget> {
  late PermissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PermissionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: MyTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: MyTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: MyTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
                // context.pop();
              },
            ),
            title: Text(
              'Back',
              style: MyTheme.of(context).titleLarge,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(1, -1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                    child: Text(
                      'Permissions',
                      style:
                      MyTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: MyTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 16, 0, 16),
                    child: Text(
                      'Manage the permissions you have granted to the app.',
                      style: MyTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: MyTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: PermissionListItemWidget(
                      icon: Icon(
                        Icons.location_on,
                      ),
                      title: 'Location',
                      status: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel2,
                    updateCallback: () => setState(() {}),
                    child: PermissionListItemWidget(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      title: 'Camera',
                      status: true,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel3,
                    updateCallback: () => setState(() {}),
                    child: PermissionListItemWidget(
                      icon: Icon(
                        Icons.photo_sharp,
                      ),
                      title: 'Photos',
                      status: true,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel4,
                    updateCallback: () => setState(() {}),
                    child: PermissionListItemWidget(
                      icon: Icon(
                        Icons.mic_rounded,
                      ),
                      title: 'Microphone',
                      status: true,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel5,
                    updateCallback: () => setState(() {}),
                    child: PermissionListItemWidget(
                      icon: Icon(
                        Icons.contacts,
                      ),
                      title: 'Contacts',
                      status: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
