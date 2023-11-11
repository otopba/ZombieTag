import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'game_page_cubit_state.g.dart';

abstract class GamePageCubitState
    implements Built<GamePageCubitState, GamePageCubitStateBuilder> {
  factory GamePageCubitState(
          [void Function(GamePageCubitStateBuilder) updates]) =
      _$GamePageCubitState;

  GamePageCubitState._();

  Game get game;

  bool get currentPlayerZombie;

  Player? get newZombie;

  int get count;
}
