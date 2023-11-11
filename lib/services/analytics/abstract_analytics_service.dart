import 'package:taggame/services/analytics/analytics_service.dart';

abstract class AbstractAnalyticsService implements AnalyticsService {
  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic> parameters = const <String, dynamic>{},
    bool? outOfSession,
  });

  @override
  Future<void> firstStart() {
    return logEvent(name: 'firstStart');
  }

  @override
  Future<void> pageOpened({
    required String screenName,
    required String action,
  }) {
    return logEvent(
      name: 'pageOpened',
      parameters: {
        "screenName": screenName,
        "action": action,
      },
    );
  }
}
