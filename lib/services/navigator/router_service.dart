import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/before_game/before_game_page.dart';
import 'package:taggame/pages/game/game_page.dart';
import 'package:taggame/pages/game_lobby/game_lobby_page.dart';
import 'package:taggame/pages/home/home_page.dart';
import 'package:taggame/pages/join_game/join_game_page.dart';
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

@TypedGoRoute<BeforeGameRoute>(path: '/beforeGame')
class BeforeGameRoute extends GoRouteData {
  const BeforeGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BeforeGamePage();
}

@TypedGoRoute<NewGameRoute>(path: '/newGame')
class NewGameRoute extends GoRouteData {
  const NewGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NewGamePage();
}

@TypedGoRoute<JoinGameRoute>(path: '/joinGame')
class JoinGameRoute extends GoRouteData {
  const JoinGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const JoinGamePage();
}

@TypedGoRoute<RosterRoute>(path: '/roster')
class RosterRoute extends GoRouteData {
  const RosterRoute({
    required this.serializedGame,
  });

  final String serializedGame;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final game = deserialize<Game>(jsonDecode(serializedGame))!;
    return RosterPage(game: game);
  }
}

@TypedGoRoute<ZombieSelectedRoute>(path: '/zombieSelected')
class ZombieSelectedRoute extends GoRouteData {
  const ZombieSelectedRoute({
    required this.serializedGame,
  });

  final String serializedGame;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final game = deserialize<Game>(jsonDecode(serializedGame))!;
    return ZombieSelectedPage(game: game);
  }
}

@TypedGoRoute<RunRoute>(path: '/run')
class RunRoute extends GoRouteData {
  const RunRoute({
    required this.serializedGame,
  });

  final String serializedGame;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final game = deserialize<Game>(jsonDecode(serializedGame))!;

    return RunPage(game: game);
  }
}

@TypedGoRoute<GameLobbyRoute>(path: '/gameLobby')
class GameLobbyRoute extends GoRouteData {
  const GameLobbyRoute({
    required this.gameId,
  });

  final String gameId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GameLobbyPage(gameId: gameId);
}

@TypedGoRoute<GameRoute>(path: '/game')
class GameRoute extends GoRouteData {
  const GameRoute({
    required this.serializedGame,
  });

  final String serializedGame;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final game = deserialize<Game>(jsonDecode(serializedGame))!;

    return GamePage(game: game);
  }
}
