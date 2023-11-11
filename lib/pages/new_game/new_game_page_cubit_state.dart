import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'new_game_page_cubit_state.g.dart';

abstract class NewGamePageCubitState
    implements Built<NewGamePageCubitState, NewGamePageCubitStateBuilder> {
  factory NewGamePageCubitState(
          [void Function(NewGamePageCubitStateBuilder) updates]) =
      _$NewGamePageCubitState;

  NewGamePageCubitState._();

  Game get game;

  Player? get currentPlayer;

  bool get loading;
}
