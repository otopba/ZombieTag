// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_service.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $newGameRoute,
      $rosterRoute,
      $zombieSelectedRoute,
      $runRoute,
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

RouteBase get $rosterRoute => GoRouteData.$route(
      path: '/roster',
      factory: $RosterRouteExtension._fromState,
    );

extension $RosterRouteExtension on RosterRoute {
  static RosterRoute _fromState(GoRouterState state) => const RosterRoute();

  String get location => GoRouteData.$location(
        '/roster',
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
      const ZombieSelectedRoute();

  String get location => GoRouteData.$location(
        '/zombieSelected',
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
  static RunRoute _fromState(GoRouterState state) => const RunRoute();

  String get location => GoRouteData.$location(
        '/run',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
