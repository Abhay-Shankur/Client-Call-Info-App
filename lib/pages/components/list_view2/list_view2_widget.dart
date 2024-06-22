import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/pages/components/list_tile2/list_tile2_widget.dart';
import 'package:call_info/providers/webEditor/domain_provider.dart';
import 'package:call_info/providers/webEditor/reviews/reviews_provider.dart';
import 'package:call_info/providers/webEditor/services/services_provider.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

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
              String title = '', desc ='', type ='';
              if(listDataItem is WebServices) {
                title = listDataItem.heading ?? '';
                desc = listDataItem.description ?? '';
                type = 'WebServices';
              } else if (listDataItem is Reviews) {
                title = listDataItem.name ?? '';
                desc = listDataItem.description ?? '';
                type = 'Reviews';
              }
              return ListTile2Widget(
                key: Key('Key815_${listDataIndex}_of_${listData.length}'),
                tileName: title,
                tileDescription: desc,
                editTile: () async {
                  await editFunc(type, index: listDataIndex);
                },
                deleteTile: () async {
                  await deleteFunc(type: type, index: listDataIndex, context: context);
                },
              );
            },
          );
        }
      },
    );
  }
  
  Future<void> editFunc(String type, {required int index}) async {
    debugPrint('Type: $type, Index: $index');
  }

  Future<void> deleteFunc({required String type, required int index, required BuildContext context}) async {
    debugPrint('Type: $type, Index: $index');
    try {
      String uid = FirebaseAuthHandler.getUid() ?? '';
      if(uid.isNotEmpty) {
        String domain = Provider.of<WebDomainProvider>(context, listen: false).domainName;
        if(domain.isNotEmpty) {
          FirestoreHandler firestore = FirestoreHandler();
          await firestore.deleteListItemAtIndexAtPath("Website", domain, type, index);
          firestore.closeConnection();
          if(context.mounted) {
            if(type == 'WebServices') Provider.of<WebServicesProvider>(context, listen: false).removeAt(index);
            if(type == 'Reviews') Provider.of<WebReviewsProvider>(context, listen: false).removeAt(index);
            showToast(context: context, type: ToastificationType.success, title: "List", desc: "Item has been deleted");
          }
        } else {
          debugPrint('Domain not authenticated.');
          showToast(context: context, type: ToastificationType.info, title: "List", desc: "Please register your Domain.");
        }
      } else {
        debugPrint('User not authenticated.');
        showToast(context: context, type: ToastificationType.info, title: "List", desc: "Not a User.");
      }
    } catch (e) {
      debugPrint('Exception : $e ');
      if(context.mounted) {
        showToast(context: context, type: ToastificationType.error, title: "List", desc: "Error occurred.");
      }
    }
  }
}
