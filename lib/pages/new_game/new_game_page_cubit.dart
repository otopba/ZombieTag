import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/game_status.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';
import 'package:uuid/uuid.dart';

const _tag = 'new_game_page_cubit';

class NewGamePageCubit extends Cubit<NewGamePageCubitState> {
  NewGamePageCubit()
      : _gameRepository = di.get(),
        _currentPlayerService = di.get(),
        super(
          NewGamePageCubitState(
            (b) => b
              ..game = Game(
                (b) => b
                  ..id = 'id'
                  ..players = ListBuilder<Player>()
                  ..status = GameStatus.stop
                  ..createdAt = DateTime.now().toUtc()
                  ..uuid = 'uuid',
              ).toBuilder()
              ..loading = false,
          ),
        ) {
    _init();
  }

  final GameRepository _gameRepository;
  final CurrentPlayerService _currentPlayerService;
  StreamSubscription? _gameSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    if (isClosed) return;

    emit(
      state.rebuild(
        (b) => b
          ..currentPlayer = currentPlayer.toBuilder()
          ..game.players = ListBuilder<Player>(
            [
              currentPlayer,
            ],
          )
          ..game.readyPlayers = ListBuilder<String>(
            [
              currentPlayer.id,
            ],
          ),
      ),
    );

    final game = await _gameRepository.createGame(
      Game(
        (b) => b
          ..id = 'id'
          ..players = ListBuilder<Player>(
            [
              currentPlayer,
            ],
          )
          ..readyPlayers = ListBuilder<String>(
            [
              currentPlayer.id,
            ],
          )
          ..status = GameStatus.stop
          ..createdAt = DateTime.now().toUtc()
          ..uuid = const Uuid().v4(),
      ),
    );

    Log.d(_tag, '_init: game = $game');

    _gameSubscription =
        _gameRepository.gameStream(game.id).listen(_onGameUpdate);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gameSubscription?.cancel();
  }

  void _onGameUpdate(Game? game) {
    Log.d(_tag, '_onGameUpdate: game = $game');

    if (game == null) return;
    if (isClosed) return;

    emit(state.rebuild((b) => b..game = game.toBuilder()));
  }

  Future<void> startGame() async {
    emit(state.rebuild((b) => b..loading = true));

    final zombieId =
        state.game.players[Random().nextInt(state.game.players.length)].id;

    await _gameRepository.run(
      gameId: state.game.id,
      zombieId: zombieId,
    );

    if (!isClosed) {
      emit(
        state.rebuild(
          (b) => b
            ..loading = false
            ..game.zombies = ListBuilder<String>(
              [zombieId],
            ),
        ),
      );
    }
  }

  bool canPressReady() {
    return isEverybodyReady() && !state.loading;
  }

  bool isEverybodyReady() {
    return state.game.readyPlayers.length == state.game.players.length &&
        state.game.players.length > 1;
  }
}
