// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_service.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $beforeGameRoute,
      $newGameRoute,
      $joinGameRoute,
      $rosterRoute,
      $zombieSelectedRoute,
      $runRoute,
      $gameLobbyRoute,
      $gameRoute,
      $resultRoute,
      $permissionSettingsDialogRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $beforeGameRoute => GoRouteData.$route(
      path: '/beforeGame',
      factory: $BeforeGameRouteExtension._fromState,
    );

extension $BeforeGameRouteExtension on BeforeGameRoute {
  static BeforeGameRoute _fromState(GoRouterState state) =>
      const BeforeGameRoute();

  String get location => GoRouteData.$location(
        '/beforeGame',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $newGameRoute => GoRouteData.$route(
      path: '/newGame',
      factory: $NewGameRouteExtension._fromState,
    );

extension $NewGameRouteExtension on NewGameRoute {
  static NewGameRoute _fromState(GoRouterState state) => const NewGameRoute();

  String get location => GoRouteData.$location(
        '/newGame',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $joinGameRoute => GoRouteData.$route(
      path: '/joinGame',
      factory: $JoinGameRouteExtension._fromState,
    );

extension $JoinGameRouteExtension on JoinGameRoute {
  static JoinGameRoute _fromState(GoRouterState state) => const JoinGameRoute();

  String get location => GoRouteData.$location(
        '/joinGame',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $rosterRoute => GoRouteData.$route(
      path: '/roster',
      factory: $RosterRouteExtension._fromState,
    );

extension $RosterRouteExtension on RosterRoute {
  static RosterRoute _fromState(GoRouterState state) => RosterRoute(
        serializedGame: state.uri.queryParameters['serialized-game']!,
      );

  String get location => GoRouteData.$location(
        '/roster',
        queryParams: {
          'serialized-game': serializedGame,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $zombieSelectedRoute => GoRouteData.$route(
      path: '/zombieSelected',
      factory: $ZombieSelectedRouteExtension._fromState,
    );

extension $ZombieSelectedRouteExtension on ZombieSelectedRoute {
  static ZombieSelectedRoute _fromState(GoRouterState state) =>
      ZombieSelectedRoute(
        serializedGame: state.uri.queryParameters['serialized-game']!,
      );

  String get location => GoRouteData.$location(
        '/zombieSelected',
        queryParams: {
          'serialized-game': serializedGame,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $runRoute => GoRouteData.$route(
      path: '/run',
      factory: $RunRouteExtension._fromState,
    );

extension $RunRouteExtension on RunRoute {
  static RunRoute _fromState(GoRouterState state) => RunRoute(
        serializedGame: state.uri.queryParameters['serialized-game']!,
      );

  String get location => GoRouteData.$location(
        '/run',
        queryParams: {
          'serialized-game': serializedGame,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $gameLobbyRoute => GoRouteData.$route(
      path: '/gameLobby',
      factory: $GameLobbyRouteExtension._fromState,
    );

extension $GameLobbyRouteExtension on GameLobbyRoute {
  static GameLobbyRoute _fromState(GoRouterState state) => GameLobbyRoute(
        gameId: state.uri.queryParameters['game-id']!,
      );

  String get location => GoRouteData.$location(
        '/gameLobby',
        queryParams: {
          'game-id': gameId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $gameRoute => GoRouteData.$route(
      path: '/game',
      factory: $GameRouteExtension._fromState,
    );

extension $GameRouteExtension on GameRoute {
  static GameRoute _fromState(GoRouterState state) => GameRoute(
        serializedGame: state.uri.queryParameters['serialized-game']!,
      );

  String get location => GoRouteData.$location(
        '/game',
        queryParams: {
          'serialized-game': serializedGame,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resultRoute => GoRouteData.$route(
      path: '/result',
      factory: $ResultRouteExtension._fromState,
    );

extension $ResultRouteExtension on ResultRoute {
  static ResultRoute _fromState(GoRouterState state) => ResultRoute(
        serializedGame: state.uri.queryParameters['serialized-game']!,
      );

  String get location => GoRouteData.$location(
        '/result',
        queryParams: {
          'serialized-game': serializedGame,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $permissionSettingsDialogRoute => GoRouteData.$route(
      path: '/permissionSettingsDialog',
      parentNavigatorKey: PermissionSettingsDialogRoute.$parentNavigatorKey,
      factory: $PermissionSettingsDialogRouteExtension._fromState,
    );

extension $PermissionSettingsDialogRouteExtension
    on PermissionSettingsDialogRoute {
  static PermissionSettingsDialogRoute _fromState(GoRouterState state) =>
      PermissionSettingsDialogRoute(
        title: state.uri.queryParameters['title']!,
        permissionRationale: state.uri.queryParameters['permission-rationale']!,
        settingsMode:
            _$boolConverter(state.uri.queryParameters['settings-mode']!),
      );

  String get location => GoRouteData.$location(
        '/permissionSettingsDialog',
        queryParams: {
          'title': title,
          'permission-rationale': permissionRationale,
          'settings-mode': settingsMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
