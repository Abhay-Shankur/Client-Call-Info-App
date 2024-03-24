import 'package:call_log/call_log.dart';

abstract class CallLogService {
  Future<Iterable<CallLogEntry>> getCallLogs();
  // Future<void> doSomething(int value);
}