import 'package:taggame/log.dart';
import 'package:taggame/services/analytics/abstract_analytics_service.dart';

const _tag = 'debug_analytics_service';

class DebugAnalyticsService extends AbstractAnalyticsService {
  DebugAnalyticsService() {
    // FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic> parameters = const <String, dynamic>{},
    bool? outOfSession,
  }) async {
    Log.d(
      _tag,
      'name: $name, parameters: $parameters, outOfSession = $outOfSession',
    );
  }

  @override
  Future<void> setUserId(String? userId) async {
    Log.d(_tag, 'Set userId = $userId');
  }

  @override
  Future<void> pageOpened({
    required String screenName,
    required String action,
  }) async {
    // Do nothing, because FirebaseAnalyticsObserver is already logging
  }
}
