import 'package:call_info/pages/dashboard/dashboard_widget.dart';
import 'package:call_info/pages/vendorProfile/profile_widget.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: MyTheme.of(context).secondaryBackground,
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
              //TODO
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardWidget()));
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Your information',
                          style: MyTheme.of(context).headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Your Name',
                                  labelStyle:
                                  MyTheme.of(context).labelMedium,
                                  hintStyle:
                                  MyTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      MyTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: MyTheme.of(context).bodyMedium,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle:
                                  MyTheme.of(context).labelMedium,
                                  hintText: 'Email',
                                  hintStyle:
                                  MyTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      MyTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: MyTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFDBE2E7),
                                ),
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: _model.textController3,
                                focusNode: _model.textFieldFocusNode3,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Contact',
                                  labelStyle:
                                  MyTheme.of(context).labelMedium,
                                  hintText: 'Mobile Number',
                                  hintStyle:
                                  MyTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      MyTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: MyTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFDBE2E7),
                                ),
                                validator: _model.textController3Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: _model.textController4,
                                focusNode: _model.textFieldFocusNode4,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Subscription',
                                  labelStyle:
                                  MyTheme.of(context).labelMedium,
                                  hintText: 'Subscription Details',
                                  hintStyle:
                                  MyTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      MyTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: MyTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFDBE2E7),
                                ),
                                validator: _model.textController4Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: _model.textController5,
                                focusNode: _model.textFieldFocusNode5,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Team Name',
                                  labelStyle:
                                  MyTheme.of(context).labelMedium,
                                  hintText: 'Team Name',
                                  hintStyle:
                                  MyTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      MyTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: MyTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: MyTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFDBE2E7),
                                ),
                                validator: _model.textController5Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile08Widget()),

                    //TODO

                      );  // context.pushNamed('Profile');
                  },
                  text: 'Save Changes',
                  options: FFButtonOptions(
                    width: 270,
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: MyTheme.of(context).primary,
                    textStyle: MyTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
