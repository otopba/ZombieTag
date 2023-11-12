import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'zombie_seleted_page_cubit_state.g.dart';

abstract class ZombieSelectedPageCubitState
    implements
        Built<ZombieSelectedPageCubitState,
            ZombieSelectedPageCubitStateBuilder> {
  factory ZombieSelectedPageCubitState(
          [void Function(ZombieSelectedPageCubitStateBuilder) updates]) =
      _$ZombieSelectedPageCubitState;

  ZombieSelectedPageCubitState._();

  Game get game;

  bool get ready;

  Player? get currentPlayer;
}
