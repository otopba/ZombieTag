import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/game/game_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'game_page_cubit';

class GamePageCubit extends Cubit<GamePageCubitState> {
  GamePageCubit({
    required Game game,
  })  : _currentPlayerService = di.get(),
        _gameRepository = di.get(),
        super(
          GamePageCubitState(
            (b) => b
              ..game = game.toBuilder()
              ..currentPlayerZombie = false,
          ),
        ) {
    _init();
  }

  final CurrentPlayerService _currentPlayerService;
  final GameRepository _gameRepository;

  late final StreamSubscription _gameSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _gameSubscription =
        _gameRepository.gameStream(state.game.id).listen(_onGameUpdate);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gameSubscription.cancel();
  }

  void _onGameUpdate(Game? game) {
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
  }

  Future<void> _loadZombie() async {
    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    final currentPlayerZombie = state.game.zombies.contains(currentPlayer.id);

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayerZombie = currentPlayerZombie));
  }
}
