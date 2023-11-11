import 'package:flutter/material.dart';
import 'package:taggame/log.dart';
import 'package:taggame/services/analytics/analytics_service.dart';
const _tag = 'route_observer_service';

class RouteObserverService extends RouteObserver {
  RouteObserverService({
    required AnalyticsService analytics,
  }) : _analytics = analytics;

  final AnalyticsService _analytics;
  final Set<AppRouteObserver> _listeners = {};

  void dispose() {
    _listeners.clear();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final oldName = previousRoute?.settings.name;
    final newName = route.settings.name;
    Log.d(_tag, 'Push from $oldName to $newName');
    for (final listener in _listeners) {
      listener.didPush(route, previousRoute);
    }

    // if (defaultRouteFilter(route)) {
    //   _sendPageOpened(route: route, action: 'push');
    // }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    for (final listener in _listeners) {
      listener.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    }

    // if (newRoute != null && defaultRouteFilter(newRoute)) {
    //   _sendPageOpened(route: newRoute, action: 'replace');
    // }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    final oldName = route.settings.name;
    final newName = previousRoute?.settings.name;
    Log.d(_tag, 'Pop from $oldName to $newName');
    final listeners = List.of(_listeners);
    for (final listener in listeners) {
      listener.didPop(route, previousRoute);
    }

    // if (previousRoute != null &&
    //     defaultRouteFilter(previousRoute) &&
    //     defaultRouteFilter(route)) {
    //   _sendPageOpened(route: previousRoute, action: 'pop');
    // }
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    final listeners = List.of(_listeners);
    for (final listener in listeners) {
      listener.didStartUserGesture(route, previousRoute);
    }
  }

  void register(AppRouteObserver listener) {
    _listeners.add(listener);
  }

  void unregister(AppRouteObserver listener) {
    _listeners.remove(listener);
  }

  void _sendPageOpened({
    required Route<dynamic> route,
    required String action,
  }) {
    // final screenName = defaultNameExtractor(route.settings);
    // if (screenName.isNullOrEmpty) return;
    //
    // _analytics.pageOpened(screenName: screenName!, action: action);
  }
}

abstract class AppRouteObserver {
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {}
}
