// call_log_service.dart

import 'package:call_info/handlers/call_log.dart';
import 'package:intl/intl.dart';

class CallLogService {
  Future<List<CallLogEntry>> retrieveCallLogs() async {
    Iterable<CallLogEntry> entries = await CallLog.get();
    return entries.toList();
  }

  Future<List<CallLogEntry>> retrieveTodayCallLogs() async {
    List<CallLogEntry> callLogs = await retrieveCallLogs();
    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);

    List<CallLogEntry> todayCallLogs = callLogs.where((log) {
      DateTime logDate = DateTime.fromMillisecondsSinceEpoch(log.timestamp!);
      String logDay = DateFormat('yyyy-MM-dd').format(logDate);
      return logDay == today;
    }).toList();

    return todayCallLogs;
  }

  Future<Map<String, int>> retrieveAndClassifyCallLogs() async {
    List<CallLogEntry> todayCallLogs = await retrieveTodayCallLogs();

    int incomingCalls = 0;
    int outgoingCalls = 0;
    int missedCalls = 0;
    int totalCalls = todayCallLogs.length;

    for (var log in todayCallLogs) {
      switch (log.callType) {
        case CallType.incoming:
          incomingCalls++;
          break;
        case CallType.outgoing:
          outgoingCalls++;
          break;
        case CallType.missed:
          missedCalls++;
          break;
        default:

          break;
      }
    }

    return {
      'incomingCalls': incomingCalls,
      'outgoingCalls': outgoingCalls,
      'missedCalls': missedCalls,
      'totalCalls': totalCalls,
    };
  }



  Future<List<CallLogEntry>> retrievePastWeekCallLogs() async {
    final Iterable<CallLogEntry> callLogs = await CallLog.get();
    final DateTime now = DateTime.now();
    final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));

    return callLogs
        .where((log) => DateTime.fromMillisecondsSinceEpoch(log.timestamp!).isAfter(sevenDaysAgo))
        .toList();
  }
}
