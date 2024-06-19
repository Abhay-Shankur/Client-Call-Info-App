import 'package:call_info/main.dart';
import 'package:call_info/providers/permissions/permissions_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
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
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                navigator.currentState?.pop();
              },
            ),
            title: Text(
              'Back',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: const AlignmentDirectional(1, -1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                    child: Text(
                      'Permissions',
                      style:
                      FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 16, 0, 16),
                    child: Text(
                      'Manage the permissions you have granted to the app.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Consumer<PermissionsProvider>(
                    builder: (context, value, child) {
                      _model.permissionListItemModel1.switchValue = value.notifications;
                      return wrapWithModel(
                        model: _model.permissionListItemModel1,
                        updateCallback: () => setState(() {
                          if(_model.permissionListItemModel1.switchValue != value.notifications) {
                            value.updateNotification(!value.notifications);
                          }
                        }),
                        updateOnChange: true,
                        child: PermissionListItemWidget(
                          icon: const Icon(
                            Icons.notifications_active,
                          ),
                          title: 'Notification',
                          status: _model.permissionListItemModel1.switchValue,
                        ),
                      );
                    },
                  ),
                  Consumer<PermissionsProvider>(
                    builder: (context, value, child) {
                      _model.permissionListItemModel2.switchValue = value.calls;
                      return wrapWithModel(
                        model: _model.permissionListItemModel2,
                        updateCallback: () => setState(() {
                          if(_model.permissionListItemModel2.switchValue != value.calls) {
                            value.updateCalls(!value.calls);
                          }
                        }),
                        updateOnChange: true,
                        child: PermissionListItemWidget(
                          icon: const Icon(
                            Icons.phone,
                          ),
                          title: 'Call Logs',
                          status: _model.permissionListItemModel2.switchValue,
                        ),
                      );
                    },
                  ),
                  Consumer<PermissionsProvider>(
                    builder: (context, value, child) {
                      _model.permissionListItemModel3.switchValue = value.storage;
                      return wrapWithModel(
                        model: _model.permissionListItemModel3,
                        updateCallback: () => setState(() {
                          if(_model.permissionListItemModel3.switchValue != value.storage) {
                            value.updateStorage(!value.storage);
                          }
                        }),
                        updateOnChange: true,
                        child: PermissionListItemWidget(
                          icon: const Icon(
                            Icons.sd_storage,
                          ),
                          title: 'Storage',
                          status: _model.permissionListItemModel3.switchValue,
                        ),
                      );
                    },
                  ),
                  Consumer<PermissionsProvider>(
                    builder: (context, value, child) {
                      _model.permissionListItemModel4.switchValue = value.contacts;
                      return wrapWithModel(
                        model: _model.permissionListItemModel4,
                        updateCallback: () => setState(() {
                          if(_model.permissionListItemModel4.switchValue != value.contacts) {
                            value.updateContacts(!value.contacts);
                          }
                        }),
                        updateOnChange: true,
                        child: PermissionListItemWidget(
                          icon: const Icon(
                            Icons.contacts,
                          ),
                          title: 'Contacts',
                          status: _model.permissionListItemModel4.switchValue,
                        ),
                      );
                    },
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
