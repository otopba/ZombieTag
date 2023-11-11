import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taggame/pages/home/home_page.dart';
import 'package:taggame/pages/new_game/new_game_page.dart';
import 'package:taggame/pages/roster/roster_page.dart';
import 'package:taggame/pages/run/run_page.dart';
import 'package:taggame/pages/zombie_seleted/zombie_seleted_page.dart';
import 'package:taggame/services/route_observer_service.dart';

part 'router_service.g.dart';

class RouterService {
  RouterService({
    required RouteObserverService routeObserverService,
    required this.printLogsEnabled,
  }) : _routeObserverService = routeObserverService;

  final RouteObserverService _routeObserverService;

  final bool printLogsEnabled;

  static final navigatorKey = GlobalKey<NavigatorState>();

  late final router = GoRouter(
    routes: $appRoutes,
    debugLogDiagnostics: printLogsEnabled,
    initialLocation: const HomeRoute().location,
    navigatorKey: navigatorKey,
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      _routeObserverService,
    ],
  );

  void dispose() {
    router.dispose();
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<NewGameRoute>(path: '/newGame')
class NewGameRoute extends GoRouteData {
  const NewGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NewGamePage();
}

@TypedGoRoute<RosterRoute>(path: '/roster')
class RosterRoute extends GoRouteData {
  const RosterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RosterPage();
}

@TypedGoRoute<ZombieSelectedRoute>(path: '/zombieSelected')
class ZombieSelectedRoute extends GoRouteData {
  const ZombieSelectedRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ZombieSelectedPage();
}

@TypedGoRoute<RunRoute>(path: '/run')
class RunRoute extends GoRouteData {
  const RunRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RunPage();
}
