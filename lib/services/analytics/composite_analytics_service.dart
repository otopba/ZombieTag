import 'dart:async';

import 'package:taggame/build_options.dart';
import 'package:taggame/services/analytics/abstract_analytics_service.dart';
import 'package:taggame/services/analytics/debug_analytics_service.dart';

class CompositeAnalyticsService extends AbstractAnalyticsService {
  CompositeAnalyticsService()
      : _analytics = buildConfig.analyticsAvailable
            ? [
              ]
            : [
                DebugAnalyticsService(),
              ];

  final List<AbstractAnalyticsService> _analytics;

  @override
  Future<void> setUserId(String? userId) async {
    for (final item in _analytics) {
      try {
        await item.setUserId(userId);
      } catch (e, stackTrace) {
        // CrashlyticsService.instance.recordHandledError(
        //   HandledError("setUserId: $e"),
        //   stackTrace: stackTrace,
        // );
      }
    }
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic> parameters = const <String, dynamic>{},
    bool? outOfSession,
  }) async {
    for (final item in _analytics) {
      try {
        await item.logEvent(
          name: name,
          parameters: parameters,
          outOfSession: outOfSession,
        );
      } catch (e, stackTrace) {
        // CrashlyticsService.instance.recordHandledError(
        //   HandledError("logEvent: $e"),
        //   stackTrace: stackTrace,
        // );
      }
    }
  }
}
