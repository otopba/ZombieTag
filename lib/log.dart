import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:taggame/build_options.dart';

enum LogLevel {
  d,
  w,
  e,
}

typedef LogPrinter = void Function(LogItem item);

class Log {
  static final List<LogPrinter> _logPrinters = [];

  static void addLogPrinter(LogPrinter logPrinter) {
    _logPrinters.add(logPrinter);
  }

  static void d(String tag, Object? message) {
    log(LogLevel.d, tag, message);
  }

  static void w(String tag, Object? message) {
    log(LogLevel.w, tag, message);
  }

  static void e(String tag, Object? message, {StackTrace? stackTrace}) {
    log(LogLevel.e, tag, message, stackTrace: stackTrace);
  }

  static void log(
    LogLevel level,
    String tag,
    Object? message, {
    StackTrace? stackTrace,
  }) {
    final now = DateTime.now();
    final isolateName = kIsWeb ? 'main' : Isolate.current.debugName;

    final logItem = LogItem(
      level: level,
      date: now,
      tag: tag,
      message: '$message',
      isolateName: isolateName,
      stackTrace: stackTrace,
    );

    for (final logPrinter in _logPrinters) {
      logPrinter(logItem);
    }

    if (!buildConfig.printLogsEnabled) return;

    if (buildConfig.forcePrintLogs) {
      debugPrintSynchronously('$logItem');
    } else {
      debugPrint('$logItem');
    }
  }
}

class LogItem {
  LogItem({
    required this.level,
    required this.date,
    required this.tag,
    required this.message,
    required this.isolateName,
    this.stackTrace,
  });

  static const _dateFormatString = 'dd-MM-yyyy–HH:mm:ss:ms';
  static final _dateFormat = DateFormat(_dateFormatString);

  final LogLevel level;
  final DateTime date;
  final String tag;
  final String message;
  final String? isolateName;
  final StackTrace? stackTrace;

  @override
  String toString() {
    var result =
        '${describeEnum(level).toUpperCase()}/${_dateFormat.format(date)} [$isolateName] $tag: $message';
    if (stackTrace != null) {
      result += '\n$stackTrace';
    }
    return result;
  }
}
