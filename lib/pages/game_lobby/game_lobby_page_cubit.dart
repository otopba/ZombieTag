import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/game_lobby/game_lobby_page_cubit_state.dart';
import 'package:taggame/repos/game_repository.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'game_lobby_page_cubit';

class GameLobbyPageCubit extends Cubit<GameLobbyPageCubitState> {
  GameLobbyPageCubit({
    required this.gameId,
  })  : _gameRepository = di.get(),
        _currentPlayerService = di.get(),
        super(
          GameLobbyPageCubitState((b) => b),
        ) {
    _init();
  }

  final String gameId;

  final GameRepository _gameRepository;
  final CurrentPlayerService _currentPlayerService;

  late final StreamSubscription _gameSubscription;
  late final StreamSubscription _playerSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _gameSubscription =
        _gameRepository.gameStream(gameId).listen(_onGameUpdate);

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

    emit(state.rebuild((b) => b..game = game.toBuilder()));
  }

  void _onPlayerUpdate(Player player) {
    Log.d(_tag, '_onPlayerUpdate: player = $player');

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayer = player.toBuilder()));
  }

  bool canPressReady() {
    final currentPlayer = state.currentPlayer;
    if (currentPlayer == null) return false;

    final game = state.game;
    if (game == null) return false;

    return !game.readyPlayers.contains(currentPlayer.id);
  }

  Future<void> ready() async {
    final currentPlayer = state.currentPlayer;
    if (currentPlayer == null) return;

    emit(state.rebuild((b) => b.game.readyPlayers.add(currentPlayer.id)));

    await _gameRepository.ready(gameId: gameId, playerId: currentPlayer.id);
  }
}
