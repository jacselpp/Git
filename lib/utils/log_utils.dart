import 'package:logger/logger.dart';

class LogUtils{
  final logger = Logger(printer: PrettyPrinter(printEmojis: false, methodCount: 0));
  final logger1 = Logger(printer: PrettyPrinter());

  void logObj(dynamic obj) => logger1.e(obj);

  void logVerbose(String log) => logger.v(log);
  void logDebug(String log) => logger.d(log);
  void logInfo(String log) => logger.i(log);
  void logWarning(String log) => logger.w(log);
  void logError(String log) => logger.e(log);
}