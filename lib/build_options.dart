import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// Example
/// --dart-define=BUILT_TYPE=debug
final BuildConfig buildConfig = _getBuiltConfig();

BuildConfig _getBuiltConfig() {
  const buildTypeValue = String.fromEnvironment(
    'BUILT_TYPE',
    defaultValue: 'debug',
  );

  final builtType = BuiltType.values
          .firstWhereOrNull((it) => describeEnum(it) == buildTypeValue) ??
      BuiltType.debug;

  switch (builtType) {
    case BuiltType.debug:
      return BuildConfig.debug;
    case BuiltType.test:
      return BuildConfig.test;
    case BuiltType.beta:
      return BuildConfig.beta;
    case BuiltType.release:
      return BuildConfig.release;
  }
}

enum BuiltType {
  debug,
  test,
  beta,
  release,
}

class BuildConfig {
  BuildConfig({
    required this.printLogsEnabled,
    required this.forcePrintLogs,
    required this.crashlyticsEnabled,
    required this.analyticsAvailable,
  });

  final bool printLogsEnabled;
  final bool forcePrintLogs;
  final bool crashlyticsEnabled;
  final bool analyticsAvailable;

  static final test = BuildConfig(
    printLogsEnabled: true,
    forcePrintLogs: true,
    crashlyticsEnabled: false,
    analyticsAvailable: false,
  );

  static final beta = BuildConfig(
    printLogsEnabled: true,
    forcePrintLogs: false,
    crashlyticsEnabled: true,
    analyticsAvailable: false,
  );

  static final debug = BuildConfig(
    printLogsEnabled: true,
    forcePrintLogs: false,
    crashlyticsEnabled: false,
    analyticsAvailable: false,
  );

  static final release = BuildConfig(
    printLogsEnabled: false,
    forcePrintLogs: false,
    crashlyticsEnabled: true,
    analyticsAvailable: true,
  );
}
