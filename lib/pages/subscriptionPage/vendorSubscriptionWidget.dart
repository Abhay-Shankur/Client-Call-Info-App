import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'vendorSubscriptionModel.dart';
export 'vendorSubscriptionModel.dart';

class ActiveSubscriptionWidget extends StatefulWidget {
  const ActiveSubscriptionWidget({super.key});

  @override
  State<ActiveSubscriptionWidget> createState() =>
      _ActiveSubscriptionWidgetState();
}

class _ActiveSubscriptionWidgetState extends State<ActiveSubscriptionWidget> {
  late ActiveSubscriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveSubscriptionModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
            setState(() {
              _isKeyboardVisible = visible;
            });
          });
    }

    _initData();

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();
  }

  void _initData() async {
    _model.switchListTileValue1 = await SharedPreferencesHelper.getBool("allowSMS");
    _model.switchListTileValue2 = await SharedPreferencesHelper.getBool("allowWP");

    _model.textController1 = TextEditingController(text: await SharedPreferencesHelper.getString("AUTH_KEY"));
    _model.textController2 = TextEditingController(text: await SharedPreferencesHelper.getString("instance_id"));
    setState(() {
      _model.switchListTileValue1;
      _model.switchListTileValue2;
      _model.textController1;
      _model.textController2;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            key: scaffoldKey,
            backgroundColor: MyTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: MyTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: true,
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
              actions: const [],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 670,
                    ),
                    decoration: BoxDecoration(
                      color: MyTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(0, -1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1, -1),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12, 32, 0, 8),
                                      child: Text(
                                        'Activate Subscription',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .displayMedium
                                            .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 35,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 8),
                                      child: Text(
                                        'Join us & get extream reach',
                                        textAlign: TextAlign.start,
                                        style: MyTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SwitchListTile.adaptive(
                                          value: _model.switchListTileValue1 ??= false,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchListTileValue1 = newValue);
                                            await SharedPreferencesHelper.setBool("allowSMS", newValue);
                                          },
                                          title: Text(
                                            'SMS',
                                            style: MyTheme.of(context).titleLarge.override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Activate SMS Service',
                                            style: MyTheme.of(context).labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          tileColor: MyTheme.of(context).secondaryBackground,
                                          activeColor: MyTheme.of(context).primary,
                                          activeTrackColor: MyTheme.of(context).accent1,
                                          dense: false,
                                          controlAffinity: ListTileControlAffinity.trailing,
                                        ),
                                        SwitchListTile.adaptive(
                                          value: _model.switchListTileValue2 ??= false,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchListTileValue2 = newValue);
                                            await SharedPreferencesHelper.setBool("allowWP", newValue);
                                          },
                                          title: Text(
                                            'WhatsApp ',
                                            style: MyTheme.of(context).titleLarge.override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Activate WhatsApp Service',
                                            style: MyTheme.of(context).labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          tileColor: MyTheme.of(context).secondaryBackground,
                                          activeColor: MyTheme.of(context).primary,
                                          activeTrackColor: MyTheme.of(context).accent1,
                                          dense: false,
                                          controlAffinity: ListTileControlAffinity.trailing,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
                                      keyboardType: TextInputType.number,
                                      autofocus: false,
                                      // textCapitalization: TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Access token',
                                        labelStyle: MyTheme.of(context)
                                            .labelLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                            MyTheme.of(context).error,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                            MyTheme.of(context).error,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: MyTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                      ),
                                      style: MyTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        lineHeight: 3,
                                      ),
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      keyboardType: TextInputType.number,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Instance id',
                                        labelStyle: MyTheme.of(context)
                                            .labelLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                            MyTheme.of(context).error,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                            MyTheme.of(context).error,
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: MyTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                      ),
                                      style: MyTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        lineHeight: 3,
                                      ),
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 28, 16, 29),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _saving = true;
                                  });
                                  await _model.save();
                                  setState(() {
                                    _saving = false;
                                  });
                                },
                                text: 'Save Account',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60,
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: MyTheme.of(context).primaryText,
                                  textStyle: MyTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: MyTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0,
                                  ),
                                  elevation: 4,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  hoverColor:
                                  MyTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if(_saving)
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black color for overlay
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
        ],
      ),
    );
  }
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
