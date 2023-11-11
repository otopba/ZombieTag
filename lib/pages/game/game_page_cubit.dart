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

const _tag = 'game_page_cubit';

class GamePageCubit extends Cubit<GamePageCubitState> {
  static const _totalCount = 10;

  GamePageCubit({
    required Game game,
  })  : _currentPlayerService = di.get(),
        _gameRepository = di.get(),
        super(
          GamePageCubitState(
            (b) => b
              ..game = game.toBuilder()
              ..currentPlayerZombie = false
              ..count = _totalCount,
          ),
        ) {
    _init();
  }

  final CurrentPlayerService _currentPlayerService;
  final GameRepository _gameRepository;

  late final StreamSubscription _gameSubscription;
  late final Timer _timer;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _gameSubscription =
        _gameRepository.gameStream(state.game.id).listen(_onGameUpdate);

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onCount,
    );
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gameSubscription.cancel();
    _timer.cancel();
  }

  Future<void> _onGameUpdate(Game? game) async {
    Log.d(_tag, '_onGameUpdate: game = $game');

    if (game == null) return;
    if (isClosed) return;

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
      final currentPlayer =
          await _currentPlayerService.currentPlayerStream.first;
      if (currentPlayer.id == state.game.zombies.first) {
        Log.d(_tag, '_onCount: finish game');
        await _gameRepository.finish(state.game.id);
      }
    }
  }
}
