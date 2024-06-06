
import 'package:call_info/providers/profile/profile_provider.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';
import 'package:call_info/main.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;
  bool _saving = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // late ProfileProvider profileProvider;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _model.provider = ProfileProvider();
    // debugPrint('${_model.provider!.profile!.vendorName!}');
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the ProfileProvider

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
              navigator.currentState?.pop();
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
                            child: GestureDetector(
                              onTap: () async {
                                await _model.pickFile();
                                setState(() {
                                  _model.pickedFile;
                                });
                              },
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null && value.profile?.imageFile != null) {
                                    return FadeInImage(
                                      placeholder: AssetImage('assets/vendor.jpg'), // Placeholder image while loading
                                      image: NetworkImage(value.profile!.imageFile!),
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.contain,
                                    );
                                  } else {
                                    if(_model.pickedFile != null) {
                                      return Image.file(
                                        _model.pickedFile!,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      );
                                    } else {
                                      return Image.asset(
                                        'assets/vendor.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      );
                                    }
                                  }
                                },
                              ),
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
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null) _model.textController1 = TextEditingController(text: value.profile!.vendorName!);
                                  return TextFormField(
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
                                  );
                                },
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
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null) _model.textController2=TextEditingController(text: value.profile!.vendorEmail!);
                                  return TextFormField(
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
                                        ,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  );
                                },
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
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null) _model.textController3 = TextEditingController(text: value.profile!.vendorContact!);
                                  return TextFormField(
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
                                        ,
                                    validator: _model.textController3Validator
                                        .asValidator(context),
                                  );
                                },
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
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null) _model.textController4 = TextEditingController(text: value.profile!.businessName!);
                                  return TextFormField(
                                    controller: _model.textController4,
                                    focusNode: _model.textFieldFocusNode4,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Business Name',
                                      labelStyle:
                                      MyTheme.of(context).labelMedium,
                                      hintText: 'Business Name',
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
                                        ,
                                    validator: _model.textController4Validator
                                        .asValidator(context),
                                  );
                                },
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
                              child: Consumer<ProfileProvider> (
                                builder: (context, value, child) {
                                  if(value.profile != null) _model.textController5 = TextEditingController(text: value.profile!.businessDescription!);
                                  return TextFormField(
                                    controller: _model.textController5,
                                    focusNode: _model.textFieldFocusNode5,
                                    maxLines: 3,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Business Description',
                                      labelStyle:
                                      MyTheme.of(context).labelMedium,
                                      hintText: 'Business Description',
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
                                        ,
                                    validator: _model.textController5Validator
                                        .asValidator(context),
                                  );
                                },
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
                    setState(() {
                      _saving = true;
                    });
                    await _model.saveProfile(context);
                    setState(() {
                      _saving = false;
                    });
                    navigator.currentState!.pop();
                    // _model.initState(context);
                    // Navigator.pushNamed(context, routeKeys.settingsPage);  // context.pushNamed('Profile');
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