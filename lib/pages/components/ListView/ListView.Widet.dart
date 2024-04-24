import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/ListTile/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ListView_Model.dart';
export 'ListView_Model.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
    required this.listParams,
  });

  final List<String>? listParams;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  late ListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listItems = widget.listParams!.toList();
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 25),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listItems.length,
          separatorBuilder: (_, __) => SizedBox(height: 25),
          itemBuilder: (context, listItemsIndex) {
            final listItemsItem = listItems[listItemsIndex];
            return wrapWithModel(
              model: _model.listTileModels.getModel(
                (widget.listParams != null && (widget.listParams)!.isNotEmpty)
                    .toString(),
                listItemsIndex,
              ),
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: ListTileWidget(
                key: Key(
                  'Key3ir_${(widget.listParams != null && (widget.listParams)!.isNotEmpty).toString()}',
                ),
                editFunc: () async {},
                dltFunc: () async {},
              ),
            );
          },
        );
      },
    );
  }
}
