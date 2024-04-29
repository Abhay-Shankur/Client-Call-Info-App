// import 'package:call_info/theme/MyTheme.dart';
// import 'package:flutterflow_ui/flutterflow_ui.dart';
// import '/pages/components/call_log/call_log_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:call_log/call_log.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class CalllogsWidget extends StatefulWidget {
//   const CalllogsWidget({super.key});
//
//   @override
//   State<CalllogsWidget> createState() => _CalllogsWidgetState();
// }
//
// class _CalllogsWidgetState extends State<CalllogsWidget> {
//   late CalllogsModel _model;
//   late List<CallLogEntry> callLogs;
//   int incomingCalls = 0;
//   int outgoingCalls = 0;
//   int totalcalls = 0;
//   int missedCalls = 0;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => CalllogsModel());
//     callLogs = [];
//     retrieveAndClassifyCallLogs();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () =>
//       _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: MyTheme
//             .of(context)
//             .primaryBackground,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(0),
//           child: AppBar(
//             backgroundColor: MyTheme
//                 .of(context)
//                 .secondaryBackground,
//             automaticallyImplyLeading: false,
//             leading: FlutterFlowIconButton(
//               borderColor: MyTheme
//                   .of(context)
//                   .primaryText,
//               borderRadius: 30,
//               borderWidth: 1,
//               buttonSize: 60,
//               fillColor: MyTheme
//                   .of(context)
//                   .primaryText,
//               icon: Icon(
//                 Icons.arrow_back_rounded,
//                 color: MyTheme
//                     .of(context)
//                     .primaryText,
//                 size: 30,
//               ),
//               onPressed: () async {
//                 //TODO
//                 // context.pop();
//               },
//             ),
//             title: Text(
//               'Page Title',
//               style: MyTheme
//                   .of(context)
//                   .headlineMedium
//                   .override(
//                 fontFamily: 'Readex Pro',
//                 color: MyTheme
//                     .of(context)
//                     .primaryText,
//                 fontSize: 22,
//               ),
//             ),
//             actions: [],
//             centerTitle: true,
//             elevation: 2,
//           ),
//         ),
//         // body: SafeArea(
//         //   top: true,
//         //   child: Column(
//         //     mainAxisSize: MainAxisSize.max,
//         //     children: [
//         //       wrapWithModel(
//         //         model: _model.callLogModel1,
//         //         updateCallback: () => setState(() {}),
//         //         child: CallLogWidget(
//         //           name: call.name ?? 'Unknown',  // This line is causing the error
//         //           number: call.number ?? 'Unknown',  // This line is causing the error
//         //           iconType: Icon(
//         //             Icons.call_received,
//         //             color: MyTheme.of(context).primary,
//         //           ),
//         //         ),
//         //       ),
//         //       wrapWithModel(
//         //         model: _model.callLogModel2,
//         //         updateCallback: () => setState(() {}),
//         //         child: CallLogWidget(
//         //           iconType: Icon(
//         //             Icons.phone_missed,
//         //             color: MyTheme
//         //                 .of(context)
//         //                 .primary,
//         //           ), name: '', number: '',
//         //         ),
//         //       ),
//         //       wrapWithModel(
//         //         model: _model.callLogModel3,
//         //         updateCallback: () => setState(() {}),
//         //         child: CallLogWidget(
//         //           iconType: Icon(
//         //             Icons.call_made,
//         //             color: MyTheme
//         //                 .of(context)
//         //                 .primary,
//         //           ), name: '', number: '',
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ),
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogsPage extends StatefulWidget {
  @override
  _CallLogsPageState createState() => _CallLogsPageState();
}

class _CallLogsPageState extends State<CallLogsPage> {
  late List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    retrieveCallLogs();
  }

  Future<void> retrieveCallLogs() async {
    if (await Permission.phone.request().isGranted) {
      var callLogs = await CallLog.get();
      setState(() {
        _callLogs = callLogs.take(100).toList(); // Limit to top 4 call logs
      });
    }
  }

  Icon getCallIcon(CallType? callType) {
    switch (callType) {
      case CallType.incoming:
        return Icon(Icons.call_received, color: Colors.green);
      case CallType.outgoing:
        return Icon(Icons.call_made, color: Colors.blue);
      case CallType.missed:
        return Icon(Icons.call_missed, color: Colors.red);
      default:
        return Icon(Icons.phone);
    }
  }

  Color getBackgroundColor(CallType? callType) {
    switch (callType) {
      case CallType.incoming:
        return Colors.green.withOpacity(0.4);
      case CallType.outgoing:
        return Colors.blue.withOpacity(0.3);
      case CallType.missed:
        return Colors.red.withOpacity(0.3);
      default:
        return Colors.black12.withOpacity(0.1);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Logs'),
      ),
      body: ListView.builder(
        itemCount: _callLogs.length,
        itemBuilder: (context, index) {
          final call = _callLogs[index];
          return ListTile(
            leading: getCallIcon(call.callType),
            title: Text(
              call.name ?? 'Unknown',
              style: TextStyle(color: Colors.black87),
            ),
            subtitle: Text(
              call.number ?? 'Unknown',
              style: TextStyle(color: Colors.black54),
            ),
            trailing: Text(
              call.callType.toString(),
              style: TextStyle(color: Colors.black87),
            ),
            tileColor: getBackgroundColor(call.callType),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CallLogsPage(),
  ));
}
