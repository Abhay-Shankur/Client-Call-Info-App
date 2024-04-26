import 'dart:ffi';

import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/permission_list_item/permission_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Back',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
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
                      FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 16, 0, 16),
                    child: Text(
                      'Manage the permissions you have granted to the app.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: FutureBuilder<bool>(
                      future: _model.checkLocationPermissionStatus(), // Assuming this method returns a Future<bool>
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget while waiting for the future to complete
                          return CircularProgressIndicator();
                        } else {
                          // Once the future completes, update the status based on the result
                          final bool permissionStatus = snapshot.data ?? false;
                          print(permissionStatus);
                          return PermissionListItemWidget(
                            icon: Icon(
                              Icons.location_on,
                            ),
                            title: 'Location',
                            status: permissionStatus,

                          );
                        }
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: FutureBuilder<bool>(
                      future: _model.checkCameraPermissionStatus(), // Assuming this method returns a Future<bool>
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget while waiting for the future to complete
                          return CircularProgressIndicator();
                        } else {
                          // Once the future completes, update the status based on the result
                          final bool permissionStatus = snapshot.data ?? false;
                          print(permissionStatus);
                          return PermissionListItemWidget(
                            icon: Icon(
                              Icons.camera_alt,
                            ),
                            title: 'Camera',
                            status: permissionStatus,
                          );
                        }
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: FutureBuilder<bool>(
                      future: _model.checkStoragePermissionStatus(), // Assuming this method returns a Future<bool>
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget while waiting for the future to complete
                          return CircularProgressIndicator();
                        } else {
                          // Once the future completes, update the status based on the result
                          final bool permissionStatus = snapshot.data ?? false;
                          print(permissionStatus);
                          return PermissionListItemWidget(
                              icon: Icon(
                              Icons.photo_sharp,
                          ),
                        title: 'Photos',
                        status:permissionStatus ,
                          );
                      }
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: FutureBuilder<bool>(
                      future: _model.checkMicrophonePermissionStatus(), // Assuming this method returns a Future<bool>
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget while waiting for the future to complete
                          return CircularProgressIndicator();
                        } else {
                          // Once the future completes, update the status based on the result
                          final bool permissionStatus = snapshot.data ?? false;
                          print(permissionStatus);
                          return PermissionListItemWidget(
                            icon: Icon(
                              Icons.mic_rounded,
                            ),
                            title: 'Microphone',
                            status:permissionStatus,
                          );
                        }
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.permissionListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: FutureBuilder<bool>(
                      future: _model.checkContactsPermissionStatus(), // Assuming this method returns a Future<bool>
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget while waiting for the future to complete
                          return CircularProgressIndicator();
                        } else {
                          // Once the future completes, update the status based on the result
                          final bool permissionStatus = snapshot.data ?? false;
                          print(permissionStatus);
                          return PermissionListItemWidget(
                            icon: Icon(
                              Icons.contacts,
                            ),
                            title: 'Contacts',
                            status: permissionStatus,

                          );
                        }
                      },
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
