abstract class AnalyticsService {
  Future<void> setUserId(String? userId);

  Future<void> logEvent({
    required String name,
    Map<String, dynamic> parameters = const <String, dynamic>{},
    bool? outOfSession,
  });

  Future<void> firstStart();

  Future<void> pageOpened({
    required String screenName,
    required String action,
  });
}
