import 'dart:async';

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
                  ..createdAt = DateTime.now().toUtc(),
              ).toBuilder(),
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
          ..game.players = ListBuilder([currentPlayer]),
      ),
    );

    final game = await _gameRepository.createGame(
      Game(
        (b) => b
          ..id = 'id'
          ..players = ListBuilder<Player>([currentPlayer])
          ..status = GameStatus.stop
          ..createdAt = DateTime.now().toUtc(),
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
}
