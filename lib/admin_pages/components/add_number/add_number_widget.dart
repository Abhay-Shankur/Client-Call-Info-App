import 'package:app/main.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/theme/my_theme.dart';

import 'add_number_model.dart';
export 'add_number_model.dart';

class AddNumberWidget extends StatefulWidget {
  const AddNumberWidget({super.key});

  @override
  State<AddNumberWidget> createState() => _AddNumberWidgetState();
}

class _AddNumberWidgetState extends State<AddNumberWidget> {
  late AddNumberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNumberModel());

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0,
          sigmaY: 0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.of(context).accent4,
          ),
          alignment: const AlignmentDirectional(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        -2,
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 3,
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: Text(
                          'Enter Mobile Number',
                          style: AppTheme.of(context)
                              .headlineSmall
                              .override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Text(
                          'Please let us know what is going on below.',
                          style:
                          AppTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                        child: TextFormField(
                          controller: _model.phoneNumberTextController,
                          focusNode: _model.phoneNumberFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          maxLength: 10,
                          decoration: InputDecoration(
                            labelStyle:
                            AppTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0,
                            ),
                            hintText: 'Mobile Number',
                            hintStyle: AppTheme.of(context)
                                .labelLarge
                                .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.of(context).primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: AppTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                          ),
                          style:
                          AppTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: AppTheme.of(context).primary,
                          validator: _model.phoneNumberTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 44),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await _model.addVendor();
                            navigator.currentState!.pop();
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: AppTheme.of(context).primary,
                            textStyle: AppTheme.of(context)
                                .titleLarge
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              color: AppTheme.of(context).primaryBtnText,
                            ),
                            elevation: 2,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
