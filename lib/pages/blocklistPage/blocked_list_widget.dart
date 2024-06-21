import 'package:call_info/handlers/permission_manager.dart';
import 'package:call_info/main.dart';
import 'package:call_info/providers/blocklist/blocklist_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:call_info/pages/components/add_number/add_number_widget.dart';
import 'package:call_info/pages/components/blocklist_item/blocklist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocked_list_model.dart';
export 'blocked_list_model.dart';

class BlockedListWidget extends StatefulWidget {
  const BlockedListWidget({super.key});

  @override
  State<BlockedListWidget> createState() => _BlockedListWidgetState();
}

class _BlockedListWidgetState extends State<BlockedListWidget> {
  late BlockedListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockedListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(()  {
      init();
    }));
  }

  Future<void> init() async {
    if(await PermissionManager.requestContactsPermission() == false) {
      showSnackbar(context, "Please Allow to access Contacts");
    }
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
                      child: const AddNumberWidget(),
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
              navigator.currentState!.pop();
            },
          ),
          title: Text(
            'Blocked Contact List',
            style: FlutterFlowTheme.of(context).titleLarge.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Text(
                'Below are numbers in your blocked list',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Builder(
                builder: (context) {
                  return Consumer<BlocklistProvider> (
                    builder: (_, value, child) {
                      final listItems = value.getList().toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listItems.length,
                        itemBuilder: (context, listItemsIndex) {
                          final listItemsItem = listItems[listItemsIndex];
                          return BlocklistItemWidget(
                            key: Key(
                                'Keyneq_${listItemsIndex}_of_${listItems.length}'),
                            number: listItemsItem,
                            dltFunc: () async {
                              value.removeItem(listItemsItem);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
