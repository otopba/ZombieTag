import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/zombie_seleted/zombie_seleted_page_cubit_state.dart';
import 'package:taggame/services/current_player_service.dart';

const _tag = 'zombie_seleted_page_cubit';

class ZombieSelectedPageCubit extends Cubit<ZombieSelectedPageCubitState> {
  ZombieSelectedPageCubit({
    required Game game,
  })  : _currentPlayerService = di.get(),
        super(
          ZombieSelectedPageCubitState(
            (b) => b
              ..game = game.toBuilder()
              ..ready = false,
          ),
        ) {
    _init();
  }

  final CurrentPlayerService _currentPlayerService;

  late final StreamSubscription _playerSubscription;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _playerSubscription =
        _currentPlayerService.currentPlayerStream.listen(_onPlayerUpdate);

    await Future.delayed(const Duration(seconds: 4));

    if (isClosed) return;

    emit(state.rebuild((b) => b..ready = true));
  }

  @override
  Future<void> close() async {
    await super.close();
    _playerSubscription.cancel();
  }

  Player getZombiePlayer() {
    final zombie = state.game.zombies.first;

    return state.game.players.firstWhere((it) => it.id == zombie);
  }

  void _onPlayerUpdate(Player player) {
    Log.d(_tag, '_onPlayerUpdate: player = $player');

    if (isClosed) return;

    emit(state.rebuild((b) => b..currentPlayer = player.toBuilder()));
  }
}
