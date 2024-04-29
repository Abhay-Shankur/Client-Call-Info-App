import 'package:call_info/pages/components/list_tile2/list_tile2_widget.dart';
import 'package:call_info/providers/webEditor/reviews/reviews_provider.dart';
import 'package:call_info/providers/webEditor/services/services_provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'list_view2_model.dart';
export 'list_view2_model.dart';

class ListView2Widget extends StatefulWidget {
  const ListView2Widget({
    super.key,
    required this.listParam,
  });

  final List<dynamic>? listParam;

  @override
  State<ListView2Widget> createState() => _ListView2WidgetState();
}

class _ListView2WidgetState extends State<ListView2Widget> {
  late ListView2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListView2Model());
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
        final listData = widget.listParam!.toList();
        if (listData.isEmpty) {
          // Show an image if list is empty
          return Center(
            child: Image.asset(
              'assets/images/noDataExists.jpg', // Replace with your image asset path
              width: 300,
              height: 300,
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listData.length,
            itemBuilder: (context, listDataIndex) {
              final listDataItem = listData[listDataIndex];
              String title = '', desc ='';
              if(listDataItem is WebServices) {
                title = listDataItem.heading! ?? '';
                desc = listDataItem.description! ?? '';
              } else if (listDataItem is Reviews) {
                title = listDataItem.name! ?? '';
                desc = listDataItem.description! ?? '';
              }
              return ListTile2Widget(
                key: Key('Key815_${listDataIndex}_of_${listData.length}'),
                tileName: title,
                tileDescription: desc,
                editTile: () async {},
                deleteTile: () async {},
              );
            },
          );
        }
      },
    );
  }
}
