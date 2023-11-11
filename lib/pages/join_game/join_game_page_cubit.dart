import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/pages/join_game/join_game_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';

const _tag = 'join_game_page_cubit';

class JoinGamePageCubit extends Cubit<JoinGamePageCubitState> {
  JoinGamePageCubit()
      : _gameRepository = di.get(),
        super(
          JoinGamePageCubitState(
            (b) => b..games = ListBuilder<Game>(),
          ),
        ) {
    _init();
  }

  final GameRepository _gameRepository;
  late final StreamSubscription _gamesSubscription;

  void _init() {
    Log.d(_tag, '_init');

    _gamesSubscription =
        _gameRepository.stoppedGamesStream().listen(_onGamesUpdated);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gamesSubscription.cancel();
  }

  void _onGamesUpdated(BuiltList<Game> games) {
    Log.d(_tag, '_onGamesUpdated: games = ${games.length}');

    if (isClosed) return;

    emit(state.rebuild((b) => b..games = games.toBuilder()));
  }

  void selectGame(Game game) {
    emit(state.rebuild((b) => b..selectedGame = game.toBuilder()));
  }
}
