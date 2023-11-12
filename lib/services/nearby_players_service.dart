import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'nearby_players_service';

class NearbyPlayersService {
  static const _platformChannel = MethodChannel('com.example/my_channel');

  NearbyPlayersService({
    required GameRepository gameRepository,
    required CurrentPlayerService currentPlayerService,
  })  : _gameRepository = gameRepository,
        _currentPlayerService = currentPlayerService {
    _init();
  }

  final GameRepository _gameRepository;
  final CurrentPlayerService _currentPlayerService;

  final _currentGameSubject = BehaviorSubject<Game?>();

  StreamSubscription? _gameSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _platformChannel.setMethodCallHandler(
      (call) async {
        switch (call.method) {
          case 'onPlayersDetected':
            Log.d(_tag, 'onPlayersDetected: ${call.arguments}');

            final arguments = (call.arguments as List<Object?>)
                .map((it) => it as String)
                .toList();

            _onPlayersDetected(arguments);

            return 'OK';
          default:
            throw PlatformException(
              code: 'Unimplemented',
              details: 'The method ${call.method} is not implemented',
            );
        }
      },
    );
  }

  Future<void> dispose() async {
    await _gameSubscription?.cancel();
    await _currentGameSubject.close();
  }

  Future<void> startGame({
    required Game game,
    required Player currentPlayer,
  }) async {
    Log.d(_tag, 'startGame');

    _currentGameSubject.add(game);

    await _gameSubscription?.cancel();

    _gameSubscription =
        _gameRepository.gameStream(game.id).listen(_onGameUpdate);

    try {
      final result = await _platformChannel.invokeMethod('startGame', [
        game.uuid,
        currentPlayer.uuid,
      ]);
      Log.d(_tag, 'result = $result');
    } on PlatformException catch (e, stackTrace) {
      Log.e(_tag, 'startGame: $e', stackTrace: stackTrace);
    }
  }

  Future<void> endGame() async {
    Log.d(_tag, 'endGame');

    await _gameSubscription?.cancel();
    _currentGameSubject.add(null);

    try {
      final result = await _platformChannel.invokeMethod('endGame');
      Log.d(_tag, 'result = $result');
    } on PlatformException catch (e, stackTrace) {
      Log.e(_tag, 'endGame: $e', stackTrace: stackTrace);
    }
  }

  Future<void> restartAdvertising() async {
    Log.d(_tag, 'restartAdvertising');

    try {
      final result = await _platformChannel.invokeMethod('restartAdvertising');
      Log.d(_tag, 'result = $result');
    } on PlatformException catch (e, stackTrace) {
      Log.e(_tag, 'restartAdvertising: $e', stackTrace: stackTrace);
    }
  }

  Future<void> _onPlayersDetected(List<String> players) async {
    final game = _currentGameSubject.valueOrNull;

    if (game == null) {
      Log.e(_tag, "_onPlayersDetected: GAME NULL!!!");
      return;
    }

    final zombiesUuids = game.zombies
        .map((it) => game.players.firstWhere((player) => player.id == it))
        .map((it) => it.uuid);

    final hasZombie = zombiesUuids.any((it) => players.contains(it));
    if (!hasZombie) {
      Log.d(_tag, "_onPlayersDetected: !hasZombie");
      return;
    }

    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    final currentPlayerIsZombie = zombiesUuids.contains(currentPlayer.uuid);
    Log.d(
      _tag,
      "_onPlayersDetected: currentPlayerIsZombie = $currentPlayerIsZombie",
    );

    if (currentPlayerIsZombie) return;

    await _gameRepository.addZombie(
      gameId: game.id,
      playerId: currentPlayer.id,
    );

    Log.d(_tag, "_onPlayersDetected: now player is zombie");

    await Future.delayed(const Duration(seconds: 2));
    await restartAdvertising();
  }

  void _onGameUpdate(Game? game) {
    if (game == null) return;

    _currentGameSubject.add(game);
  }
}
