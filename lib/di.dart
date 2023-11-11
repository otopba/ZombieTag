import 'package:get_it/get_it.dart';
import 'package:taggame/build_options.dart';
import 'package:taggame/repos/shared_preferences_repository.dart';
import 'package:taggame/services/analytics/analytics_service.dart';
import 'package:taggame/services/analytics/composite_analytics_service.dart';
import 'package:taggame/services/localization_service.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/services/route_observer_service.dart';

final di = GetIt.instance;

extension GetItEx on GetIt {
  Future<void> setup() => setupDi();
}

Future<void> setupDi() async {
  di.registerSingleton<SharedPreferencesRepository>(
    SharedPreferencesRepository.instance,
  );

  di.registerSingleton<AnalyticsService>(CompositeAnalyticsService());

  di.registerSingleton<RouteObserverService>(
    RouteObserverService(analytics: di.get()),
  );

  di.registerSingleton<RouterService>(
    RouterService(
      routeObserverService: di.get(),
      printLogsEnabled: buildConfig.printLogsEnabled,
    ),
    dispose: (it) => it.dispose(),
  );

  di.registerSingleton<LocalizationService>(
    LocalizationService(prefs: di.get()),
  );

  return di.allReady();
}
