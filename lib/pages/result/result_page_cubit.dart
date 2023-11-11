import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/result/result_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'result_page_cubit';

class ResultPageCubit extends Cubit<ResultPageCubitState> {
  ResultPageCubit({
    required Game game,
  })  : _currentPlayerService = di.get(),
        _gameRepository = di.get(),
        super(
          ResultPageCubitState(
            (b) => b..game = game.toBuilder(),
          ),
        ) {
    _init();
  }

  final CurrentPlayerService _currentPlayerService;
  final GameRepository _gameRepository;

  late final StreamSubscription _gameSubscription;
  late final StreamSubscription _playerSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _gameSubscription =
        _gameRepository.gameStream(state.game.id).listen(_onGameUpdate);

    _playerSubscription =
        _currentPlayerService.currentPlayerStream.listen(_onPlayerUpdate);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _gameSubscription.cancel();
    await _playerSubscription.cancel();
  }

  void _onGameUpdate(Game? game) {
    Log.d(_tag, '_onGameUpdate: game = $game');

    if (game == null) return;
    if (isClosed) return;

    emit(
      state.rebuild((b) => b..game = game.toBuilder()),
    );
  }

  void _onPlayerUpdate(Player player) {
    Log.d(_tag, '_onPlayerUpdate: player = $player');

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayer = player.toBuilder()));
  }
}
