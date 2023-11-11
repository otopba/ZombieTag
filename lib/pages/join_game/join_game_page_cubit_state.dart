import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:built_collection/built_collection.dart';

part 'join_game_page_cubit_state.g.dart';

abstract class JoinGamePageCubitState
    implements Built<JoinGamePageCubitState, JoinGamePageCubitStateBuilder> {
  factory JoinGamePageCubitState(
          [void Function(JoinGamePageCubitStateBuilder) updates]) =
      _$JoinGamePageCubitState;

  JoinGamePageCubitState._();

  BuiltList<Game> get games;

  Game? get selectedGame;
}
