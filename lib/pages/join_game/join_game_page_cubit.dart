import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/join_game/join_game_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'join_game_page_cubit';

class JoinGamePageCubit extends Cubit<JoinGamePageCubitState> {
  JoinGamePageCubit()
      : _gameRepository = di.get(),
        _currentPlayerService = di.get(),
        super(
          JoinGamePageCubitState(
            (b) => b
              ..games = ListBuilder<Game>()
              ..loading = false
              ..finish = false,
          ),
        ) {
    _init();
  }

  final GameRepository _gameRepository;
  final CurrentPlayerService _currentPlayerService;

  late final StreamSubscription _gamesSubscription;
  late final StreamSubscription _playerSubscription;

  void _init() {
    Log.d(_tag, '_init');

    _gamesSubscription =
        _gameRepository.stoppedGamesStream().listen(_onGamesUpdated);

    _playerSubscription =
        _currentPlayerService.currentPlayerStream.listen(_onPlayerUpdate);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gamesSubscription.cancel();
    await _playerSubscription.cancel();
  }

  void _onGamesUpdated(BuiltList<Game> games) {
    Log.d(_tag, '_onGamesUpdated: games = ${games.length}');

    if (isClosed) return;

    emit(state.rebuild((b) => b..games = games.toBuilder()));
  }

  void selectGame(Game game) {
    emit(state.rebuild((b) => b..selectedGame = game.toBuilder()));
  }

  Future<void> join() async {
    emit(state.rebuild((b) => b..loading = true));

    final currentPlayer = await _currentPlayerService.currentPlayerStream.first;

    await _gameRepository.joinGame(
      gameId: state.selectedGame!.id,
      player: currentPlayer,
    );

    if (isClosed) return;

    emit(
      state.rebuild(
        (b) => b
          ..loading = true
          ..finish = true,
      ),
    );
  }

  void _onPlayerUpdate(Player player) {
    Log.d(_tag, '_onPlayerUpdate: player = $player');

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayer = player.toBuilder()));
  }
}
