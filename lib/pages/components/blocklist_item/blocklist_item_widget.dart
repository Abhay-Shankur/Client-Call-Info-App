import 'package:call_info/theme/my_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'blocklist_item_model.dart';
export 'blocklist_item_model.dart';

class BlocklistItemWidget extends StatefulWidget {
  const BlocklistItemWidget({
    super.key,
    String? name,
    String? number,
    required this.dltFunc,
  })  : name = name ?? 'Unknown',
        number = number ?? 'null';

  final String name;
  final String number;
  final Future Function()? dltFunc;

  @override
  State<BlocklistItemWidget> createState() => _BlocklistItemWidgetState();
}

class _BlocklistItemWidgetState extends State<BlocklistItemWidget> {
  late BlocklistItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlocklistItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: MyTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x320E151B),
              offset: Offset(
                0.0,
                1,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          widget.name,
                          style:
                          MyTheme.of(context).titleLarge.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Text(
                        widget.number,
                        style:
                        MyTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 40,
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: MyTheme.of(context).error,
                  size: 20,
                ),
                onPressed: () async {
                  await widget.dltFunc!.call();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
