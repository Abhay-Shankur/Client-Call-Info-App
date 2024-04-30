
import 'package:call_info/main.dart';
import 'package:call_info/providers/sms/sms_provider.dart';
import 'package:call_info/providers/wp/wp_provider.dart';
import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import 'subscription_page_model.dart';
export 'subscription_page_model.dart';

class SubscriptionPageWidget extends StatefulWidget {
  const SubscriptionPageWidget({super.key});

  @override
  State<SubscriptionPageWidget> createState() => _SubscriptionPageWidgetState();
}

class _SubscriptionPageWidgetState extends State<SubscriptionPageWidget> {
  late SubscriptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
            setState(() {
              _isKeyboardVisible = visible;
            });
          });
    }

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: MyTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: MyTheme.of(context).primaryBackground,
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
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'Activate Subscription',
            style: MyTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: MyTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 670,
                ),
                decoration: BoxDecoration(
                  color: MyTheme.of(context).secondaryBackground,
                ),
                alignment: AlignmentDirectional(0, -1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, -1),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 8),
                                            child: Text(
                                              'Subscription Details',
                                              textAlign: TextAlign.start,
                                              style:
                                              MyTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                fontSize: 25,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12, 0, 0, 8),
                                            child: Text(
                                              'You been part of family since ',
                                              textAlign: TextAlign.start,
                                              style:
                                              MyTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12, 0, 0, 8),
                                            child: Text(
                                              'Your journey ends on',
                                              textAlign: TextAlign.start,
                                              style:
                                              MyTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2,
                                          indent: 10,
                                          endIndent: 10,
                                          color: MyTheme.of(context)
                                              .primaryText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, -1),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 8),
                                          child: Text(
                                            'Available Services',
                                            textAlign: TextAlign.start,
                                            style: MyTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 25,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Consumer<SMSProvider> (
                                        builder: (context, value, child) {
                                          _model.switchListTileValue1 = value.allowed;
                                          return SwitchListTile.adaptive(
                                            value: _model.switchListTileValue1 ??=
                                            false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                              _model.switchListTileValue1 =
                                                  newValue);
                                              await Provider.of<SMSProvider>(context, listen: false).updateAllowed(newValue);
                                            },
                                            title: Text(
                                              'SMS',
                                              style: MyTheme.of(context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Activate SMS Service',
                                              style: MyTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            tileColor: MyTheme.of(context)
                                                .secondaryBackground,
                                            activeColor:
                                            MyTheme.of(context)
                                                .primary,
                                            activeTrackColor:
                                            MyTheme.of(context)
                                                .accent1,
                                            dense: false,
                                            controlAffinity:
                                            ListTileControlAffinity.trailing,
                                          );
                                        },
                                      ),
                                      Consumer<WPProvider> (
                                        builder: (context, value, child) {
                                          _model.switchListTileValue2 = value.allowed;
                                          return SwitchListTile.adaptive(
                                            value: _model.switchListTileValue2 ??= false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                              _model.switchListTileValue2 =
                                                  newValue);
                                              value.updateAllowed(newValue);
                                            },
                                            title: Text(
                                              'WhatsApp ',
                                              style: MyTheme.of(context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Activate WhatsApp Service',
                                              style: MyTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            tileColor: MyTheme.of(context)
                                                .secondaryBackground,
                                            activeColor:
                                            MyTheme.of(context)
                                                .primary,
                                            activeTrackColor:
                                            MyTheme.of(context)
                                                .accent1,
                                            dense: false,
                                            controlAffinity:
                                            ListTileControlAffinity.trailing,
                                          );
                                        },
                                      ),
                                      Divider(
                                        thickness: 2,
                                        indent: 10,
                                        endIndent: 10,
                                        color: MyTheme.of(context)
                                            .primaryText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          'Repeating Message ',
                                          textAlign: TextAlign.start,
                                          style: MyTheme.of(context)
                                              .bodyLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Container(
                                          width: double.infinity,
                                          child: Slider(
                                            activeColor:
                                            MyTheme.of(context)
                                                .primaryText,
                                            inactiveColor:
                                            MyTheme.of(context)
                                                .alternate,
                                            min: 0,
                                            max: 49,
                                            value: _model.sliderValue ??= 7,
                                            label: _model.sliderValue
                                                ?.toStringAsFixed(0),
                                            divisions: 7,
                                            onChanged: (newValue) {
                                              newValue = double.parse(
                                                  newValue.toStringAsFixed(0));
                                              setState(() => _model
                                                  .sliderValue = newValue);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      indent: 10,
                                      endIndent: 10,
                                      color: MyTheme.of(context)
                                          .primaryText,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                          child: ListTile(
                                            title: Text(
                                              'Block Contacts',
                                              style:
                                              MyTheme.of(context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                              MyTheme.of(context)
                                                  .primaryText,
                                              size: 20,
                                            ),
                                            tileColor:
                                            MyTheme.of(context)
                                                .primaryText,
                                            dense: false,
                                            contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      indent: 10,
                                      endIndent: 10,
                                      color: MyTheme.of(context)
                                          .primaryText,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Text(
                                          'Connect Your Whatsapp Account',
                                          textAlign: TextAlign.start,
                                          style: MyTheme.of(context)
                                              .bodyLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Consumer<WPProvider> (
                                        builder: (context, value, child) {
                                          if(value.accessToken != null && value.accessToken!.isNotEmpty)
                                            _model.textController1 = TextEditingController(text: value.accessToken!);
                                          return TextFormField(
                                            controller: _model.textController1,
                                            focusNode: _model.textFieldFocusNode1,
                                            autofocus: false,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Access token',
                                              labelStyle:
                                              MyTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .alternate,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .primary,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                              MyTheme.of(context)
                                                  .secondaryBackground,
                                              contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 16, 8),
                                            ),
                                            style: MyTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                              lineHeight: 3,
                                            ),
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Consumer<WPProvider> (
                                        builder: (context, value, child) {
                                          if(value.instanceId != null && value.instanceId!.isNotEmpty)
                                            _model.textController2 = TextEditingController(text: value.instanceId!);
                                          return TextFormField(
                                            controller: _model.textController2,
                                            focusNode: _model.textFieldFocusNode2,
                                            autofocus: false,
                                            obscureText: false,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Instance id',
                                              labelStyle:
                                              MyTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .alternate,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .primary,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                  MyTheme.of(context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight: Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                              MyTheme.of(context)
                                                  .secondaryBackground,
                                              contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 16, 8),
                                            ),
                                            style: MyTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                              lineHeight: 3,
                                            ),
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
                          EdgeInsetsDirectional.fromSTEB(16, 28, 16, 29),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await _model.save(context);
                            },
                            text: 'Save Account',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                              borderSide: BorderSide(
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
    );
  }
}
