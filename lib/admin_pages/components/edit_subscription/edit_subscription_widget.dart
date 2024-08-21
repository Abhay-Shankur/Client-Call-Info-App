import 'package:app/main.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:app/theme/my_theme.dart';

import 'edit_subscription_model.dart';
export 'edit_subscription_model.dart';

class EditSubscriptionWidget extends StatefulWidget {
  const EditSubscriptionWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<EditSubscriptionWidget> createState() => _EditSubscriptionWidgetState();
}

class _EditSubscriptionWidgetState extends State<EditSubscriptionWidget>
    with TickerProviderStateMixin {
  late EditSubscriptionModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSubscriptionModel());

    _model.subscriptionTypeTextController ??= TextEditingController();
    _model.subscriptionTypeFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorsListProvider>(
      builder: (context, model, child){
        final String id = widget.id ?? '';
        Map<String,dynamic> details = model.getVendor(widget.id!) as Map<String, dynamic>;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.of(context).accent4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 2, 16, 16),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 670,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 12,
                        color: Color(0x1E000000),
                        offset: Offset(
                          0,
                          5,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 0, 0),
                        child: Text(
                          'Edit Subscription',
                          style:
                          AppTheme.of(context).headlineMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
                        child: Text(
                          'Below are your profile details',
                          style: AppTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: TextFormField(
                              controller: _model.subscriptionTypeTextController,
                              focusNode: _model.subscriptionTypeFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Subscription Type',
                                labelStyle: AppTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0,
                                ),
                                hintStyle: AppTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: AppTheme.of(context).secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                              ),
                              style: AppTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0,
                              ),
                              maxLines: null,
                              cursorColor: AppTheme.of(context).primary,
                              validator:
                              _model.subscriptionTypeTextControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                if (datePicked1Date != null) {
                                  safeSetState(() {
                                    _model.datePicked1 = DateTime(
                                      datePicked1Date.year,
                                      datePicked1Date.month,
                                      datePicked1Date.day,
                                    );
                                  });
                                }
                              },
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 570,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Start Date ',
                                                style: AppTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.datePicked1?.toString(),
                                                    'Start Date',
                                                  ),
                                                  style:
                                                  AppTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                if (datePicked2Date != null) {
                                  safeSetState(() {
                                    _model.datePicked2 = DateTime(
                                      datePicked2Date.year,
                                      datePicked2Date.month,
                                      datePicked2Date.day,
                                    );
                                  });
                                }
                              },
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 570,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'End Date',
                                                style: AppTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.datePicked2?.toString(),
                                                    'End Date',
                                                  ),
                                                  style:
                                                  AppTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                              'Created On:',
                                              style: AppTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                              details["Subscription"]?["created"] ?? 'Inactive',
                                              style: AppTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                              'Last Active:',
                                              style: AppTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                              details["Subscription"]?["type"] ?? 'Inactive',
                                              style: AppTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0.05),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  height: 44,
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                  iconPadding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: AppTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: AppTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0,
                                  ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: AppTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  hoverColor:
                                  AppTheme.of(context).alternate,
                                  hoverBorderSide: BorderSide(
                                    color: AppTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  hoverTextColor:
                                  AppTheme.of(context).primaryText,
                                  hoverElevation: 3,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0.05),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await _model.saveChanges(widget.id!);
                                  navigator.currentState!.pop();
                                },
                                text: 'Save Changes',
                                options: FFButtonOptions(
                                  height: 44,
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                  iconPadding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: AppTheme.of(context).primary,
                                  textStyle: AppTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0,
                                  ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  hoverColor: AppTheme.of(context).accent1,
                                  hoverBorderSide: BorderSide(
                                    color: AppTheme.of(context).primary,
                                    width: 1,
                                  ),
                                  hoverTextColor:
                                  AppTheme.of(context).primaryText,
                                  hoverElevation: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        );
      }
    );
  }
}
