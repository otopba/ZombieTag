import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/game_status.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/game/game_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';
import 'package:taggame/services/nearby_players_service.dart';
import 'package:taggame/services/step_count_service.dart';
import 'package:taggame/services/wakelock_service.dart';

const _tag = 'game_page_cubit';

class GamePageCubit extends Cubit<GamePageCubitState> {
  static const _gameTime = 300;

  GamePageCubit({
    required Game game,
  })  : _currentPlayerService = di.get(),
        _gameRepository = di.get(),
        _nearbyPlayersService = di.get(),
        _stepCountService = di.get(),
        _wakelockService = di.get(),
        super(
          GamePageCubitState(
            (b) => b
              ..game = game.toBuilder()
              ..currentPlayerZombie = false
              ..count = _gameTime,
          ),
        ) {
    _init();
  }

  final CurrentPlayerService _currentPlayerService;
  final GameRepository _gameRepository;
  final NearbyPlayersService _nearbyPlayersService;
  final StepCountService _stepCountService;
  final WakelockService _wakelockService;

  late final StreamSubscription _gameSubscription;
  late final StreamSubscription _playerSubscription;

  late final Timer _timer;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _wakelockService.enable();

    _stepCountService.start();

    _gameSubscription =
        _gameRepository.gameStream(state.game.id).listen(_onGameUpdate);

    _playerSubscription =
        _currentPlayerService.currentPlayerStream.listen(_onPlayerUpdate);

    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    await _nearbyPlayersService.startGame(
      game: state.game,
      currentPlayer: currentPlayer,
    );

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onCount,
    );
  }

  @override
  Future<void> close() async {
    await super.close();
    _timer.cancel();
    await _gameSubscription.cancel();
    await _playerSubscription.cancel();
    await _nearbyPlayersService.endGame();
    await _stepCountService.stop();
    _wakelockService.disable();
  }

  Future<void> _onGameUpdate(Game? game) async {
    Log.d(_tag, '_onGameUpdate: game = $game');

    if (game == null) return;
    if (isClosed) return;

    if (game.status == GameStatus.finished) {
      await _nearbyPlayersService.endGame();

      final count = await _stepCountService.stop();
      await _gameRepository.addSteps(
        gameId: game.id,
        playerId: state.currentPlayer?.id ?? '', //fixme
        count: count,
      );

      _wakelockService.disable();
    }

    Player? newZombie;
    if (game.zombies.length > state.game.zombies.length) {
      final newZombieId = game.zombies.last;
      newZombie = game.players.firstWhere((it) => it.id == newZombieId);
    }

    Log.d(_tag, '_onGameUpdate: newZombie = $newZombie');

    emit(
      state.rebuild(
        (b) => b
          ..game = game.toBuilder()
          ..newZombie = newZombie?.toBuilder(),
      ),
    );

    _loadZombie();

    if (game.zombies.length == game.players.length &&
        game.status != GameStatus.finished) {
      _timer.cancel();

      final currentPlayer =
          await _currentPlayerService.currentPlayerStream.first;
      if (currentPlayer.id == game.zombies.first) {
        Log.d(_tag, '_onGameUpdate: finish game');
        await _gameRepository.finish(game.id);
      }
    }
  }

  Future<void> _loadZombie() async {
    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    final currentPlayerZombie = state.game.zombies.contains(currentPlayer.id);

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayerZombie = currentPlayerZombie));
  }

  Future<void> _onCount(Timer timer) async {
    if (isClosed) return;

    Log.d(_tag, '_onCount');

    emit(state.rebuild((b) => b..count = max(0, state.count - 1)));

    if (state.count == 0) {
      _timer.cancel();
      final currentPlayer =
          await _currentPlayerService.currentPlayerStream.first;
      if (currentPlayer.id == state.game.zombies.first) {
        Log.d(_tag, '_onCount: finish game');
        await _gameRepository.finish(state.game.id);
      }
    }
  }

  void _onPlayerUpdate(Player player) {
    Log.d(_tag, '_onPlayerUpdate: player = $player');

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayer = player.toBuilder()));
  }
}
