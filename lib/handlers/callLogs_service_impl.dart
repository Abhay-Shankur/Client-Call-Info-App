import 'package:call_info/handlers/callLogs_service.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/services.dart';

class CallLogsServiceImpl extends CallLogService {

  @override
  Future<Iterable<CallLogEntry>> getCallLogs() async {
    // TODO: implement getCallLogs
    try {
      final Iterable<CallLogEntry> cLog = await CallLog.get();
      print('Queried call log entries');
      for (CallLogEntry entry in cLog) {
        print('-------------------------------------');
        print('F. NUMBER  : ${entry.formattedNumber}');
        print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
        print('NUMBER     : ${entry.number}');
        print('NAME       : ${entry.name}');
        print('TYPE       : ${entry.callType}');
        print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}');
        print('DURATION   : ${entry.duration}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('SIM NAME   : ${entry.simDisplayName}');
        print('-------------------------------------');
      }
      // return true;
      return cLog;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return [];
    }
    // throw UnimplementedError();
  }



}