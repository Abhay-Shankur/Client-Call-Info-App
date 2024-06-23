import 'package:app/main.dart';
import 'package:app/providers/vendors/vendors_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/admin_pages/components/add_number/add_number_widget.dart';
import '/admin_pages/components/vendor_item/vendor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  // context.pushNamed(
                  //   'adminProfile',
                  //   extra: <String, dynamic>{
                  //     kTransitionInfoKey: TransitionInfo(
                  //       hasTransition: true,
                  //       transitionType: PageTransitionType.leftToRight,
                  //     ),
                  //   },
                  // );
                  navigator.currentState!.pushNamed(RouteKeys.profile);
                  // navigator.currentState!.pushNamed(RouteKeys.profile,
                  //     arguments: <String, dynamic>{
                  //       kTransitionInfoKey: TransitionInfo(
                  //         hasTransition: true,
                  //         transitionType: PageTransitionType.leftToRight,
                  //       ),
                  //     }
                  // );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/adminImage.jpg',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, 0),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                          child: Text(
                            'Our list is below',
                            style: FlutterFlowTheme.of(context)
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
                child: Consumer<VendorsListProvider>(
                    builder: (context, model, child) {
                      Map<String, dynamic> listItems = model.vendors;
                      final listIds = listItems.keys.toList();
                      // final listIds = snapshot.data!;
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
                ),
                // child: FutureBuilder(
                //     future: _model.getVendors(),
                //     builder: (context, snapshot) {
                //       // Check the state of the Future
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         // While the data is loading, show a loading indicator
                //         return const Center(child: CircularProgressIndicator());
                //       } else if (snapshot.hasError) {
                //         // If there's an error, display it
                //         return Center(child: Text('Error: ${snapshot.error}'));
                //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //         // If no data is returned, display a message
                //         return const Center(child: Text('No data available'));
                //       } else {
                //         // return Container();
                //         // If the data is available, display the list
                //         return Consumer<VendorsListProvider>(
                //             builder: (context, model, child) {
                //               Map<String, dynamic> listItems = model.vendors;
                //               final listIds = snapshot.data!;
                //               if(listItems.isEmpty) {
                //                 return Container();
                //               } else {
                //                 return SingleChildScrollView(
                //                   child: Column(
                //                     mainAxisSize: MainAxisSize.max,
                //                     children: List.generate(listIds.length, (listIdsIndex) {
                //                       final listItemsItem = listItems[listIds[listIdsIndex]];
                //                       if(listItemsItem != null ) {
                //                         return VendorItemWidget(
                //                           key: Key('Keygal_${listIdsIndex}_of_${listIds.length}'),
                //                           id: listIds[listIdsIndex],
                //                           value: listItemsItem,
                //                         );
                //                       } else {
                //                         return Container();
                //                       }
                //                     })
                //                         .divide(const SizedBox(height: 5))
                //                         .around(const SizedBox(height: 5)),
                //                   ),
                //                 );
                //               }
                //             }
                //         );
                //       }
                //     }
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
