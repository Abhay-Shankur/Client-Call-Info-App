import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'list_tile2_model.dart';
export 'list_tile2_model.dart';

class ListTile2Widget extends StatefulWidget {
  const ListTile2Widget({
    super.key,
    required this.tileName,
    required this.tileDescription,
    required this.editTile,
    required this.deleteTile,
  });

  final String? tileName;
  final String? tileDescription;
  final Future Function()? editTile;
  final Future Function()? deleteTile;

  @override
  State<ListTile2Widget> createState() => _ListTile2WidgetState();
}

class _ListTile2WidgetState extends State<ListTile2Widget> {
  late ListTile2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListTile2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
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
          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          valueOrDefault<String>(
                            widget.tileName,
                            'Name',
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.tileDescription,
                            'description',
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
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
                  Icons.edit_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                showLoadingIndicator: true,
                onPressed: () async {
                  await widget.editTile!.call();
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 40,
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: FlutterFlowTheme.of(context).error,
                  size: 20,
                ),
                showLoadingIndicator: true,
                onPressed: () async {
                  await widget.deleteTile!.call();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
