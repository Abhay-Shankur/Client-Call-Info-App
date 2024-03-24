import 'package:workmanager/workmanager.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/services.dart';

class BackgroundTask {
  static late Iterable<CallLogEntry> cLog;

  static void callbackDispatcher() {
    Workmanager().executeTask((dynamic task, dynamic inputData) async {
      print('Background Services are Working!');
      try {
        cLog = await CallLog.get();
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
        return true;
      } on PlatformException catch (e, s) {
        print(e);
        print(s);
        return true;
      }
    });
  }
}

