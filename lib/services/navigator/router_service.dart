import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taggame/dialog/dialog_page.dart';
import 'package:taggame/dialog/permission_settings_dialog.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/before_game/before_game_page.dart';
import 'package:taggame/pages/game/game_page.dart';
import 'package:taggame/pages/game_lobby/game_lobby_page.dart';
import 'package:taggame/pages/home/home_page.dart';
import 'package:taggame/pages/join_game/join_game_page.dart';
import 'package:taggame/pages/new_game/new_game_page.dart';
import 'package:taggame/pages/result/result_page.dart';
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

@TypedGoRoute<ResultRoute>(path: '/result')
class ResultRoute extends GoRouteData {
  const ResultRoute({
    required this.serializedGame,
  });

  final String serializedGame;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final game = deserialize<Game>(jsonDecode(serializedGame))!;

    return ResultPage(game: game);
  }
}

@TypedGoRoute<PermissionSettingsDialogRoute>(path: '/permissionSettingsDialog')
class PermissionSettingsDialogRoute extends GoRouteData {
  const PermissionSettingsDialogRoute({
    required this.title,
    required this.permissionRationale,
    required this.settingsMode,
  });

  final String title;
  final String permissionRationale;
  final bool settingsMode;

  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      RouterService.navigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DialogPage(
      key: state.pageKey,
      child: PermissionSettingsDialog(
        title: title,
        permissionRationale: permissionRationale,
        settingsMode: settingsMode,
      ),
    );
  }
}
