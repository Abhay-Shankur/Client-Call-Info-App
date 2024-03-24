import 'package:call_info/handlers/callLogs_service.dart';
import 'package:call_info/handlers/callLogs_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<CallLogService>(() => CallLogsServiceImpl());
}