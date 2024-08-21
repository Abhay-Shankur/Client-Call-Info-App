import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
// import '/flutter_flow/custom_functions.dart' as functions;
import '/admin_pages/components/add_number/add_number_widget.dart';
import '/admin_pages/components/vendor_item/vendor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/my_theme.dart';

import 'vendor_list_model.dart';
export 'vendor_list_model.dart';

class VendorListWidget extends StatefulWidget {
  const VendorListWidget({super.key});

  @override
  State<VendorListWidget> createState() => _VendorListWidgetState();
}

class _VendorListWidgetState extends State<VendorListWidget> {
  late VendorListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorListModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFF1F5F8),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0, 0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: AddNumberWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              backgroundColor: AppTheme.of(context).primary,
              elevation: 8,
              child: Icon(
                Icons.add,
                color: AppTheme.of(context).info,
                size: 24,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: AppTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Icon(
                                Icons.search_rounded,
                                color: AppTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 5),
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search vendors...',
                                      labelStyle: AppTheme.of(context)
                                          .labelMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                      ),
                                      hintStyle: AppTheme.of(context)
                                          .labelMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: AppTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: AppTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0,
                                    ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 9),
                              child: FlutterFlowIconButton(
                                borderColor:
                                AppTheme.of(context).alternate,
                                borderRadius: 20,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: AppTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.tune_rounded,
                                  color: AppTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () {
                                  debugPrint('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 10),
                                  child: Text(
                                    'Our list is below',
                                    style: AppTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x411D2429),
                              offset: Offset(
                                0.0,
                                1,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // child: Consumer<VendorsListProvider>(
                        //   builder: (context, model, child) {
                        //     Map<String, dynamic> listItems = model.vendors;
                        //     final listIds = model.ids;
                        //
                        //     if (listItems.isEmpty || listIds.isEmpty) {
                        //       // Show a loading indicator while the data is being fetched
                        //       return const Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     } else {
                        //       // Show the list once the data is available
                        //       return SingleChildScrollView(
                        //         child: Column(
                        //           mainAxisSize: MainAxisSize.max,
                        //           children: List.generate(listIds.length, (listIdsIndex) {
                        //             final listItemsItem = listItems[listIds[listIdsIndex]];
                        //             return VendorItemWidget(
                        //               key: Key('Keygal_${listIdsIndex}_of_${listIds.length}'),
                        //               id: listIds[listIdsIndex],
                        //               value: listItemsItem,
                        //             );
                        //           })
                        //               .divide(const SizedBox(height: 5))
                        //               .around(const SizedBox(height: 5)),
                        //         ),
                        //       );
                        //     }
                        //   },
                        // ),
                        child: FutureBuilder(
                            future: _model.getVendors(),
                            builder: (context, snapshot) {
                              // Check the state of the Future
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                // While the data is loading, show a loading indicator
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                // If there's an error, display it
                                return Center(child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                // If no data is returned, display a message
                                return const Center(child: Text('No data available'));
                              } else {
                                // return Container();
                                // If the data is available, display the list
                                return Consumer<VendorsListProvider>(
                                    builder: (context, model, child) {
                                      Map<String, dynamic> listItems = model.vendors;
                                      final listIds = snapshot.data!;
                                      if(listItems.isEmpty) {
                                        return Container();
                                      } else {
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(listIds.length, (listIdsIndex) {
                                              final listItemsItem = listItems[listIds[listIdsIndex]];
                                              if(listItemsItem != null ) {
                                                return VendorItemWidget(
                                                  key: Key('Keygal_${listIdsIndex}_of_${listIds.length}'),
                                                  id: listIds[listIdsIndex],
                                                  value: listItemsItem,
                                                );
                                              } else {
                                                return Container();
                                              }
                                            })
                                                .divide(const SizedBox(height: 5))
                                                .around(const SizedBox(height: 5)),
                                          ),
                                        );
                                      }
                                    }
                                );
                              }
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
