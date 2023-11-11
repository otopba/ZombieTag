import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'result_page_cubit_state.g.dart';

abstract class ResultPageCubitState
    implements Built<ResultPageCubitState, ResultPageCubitStateBuilder> {
  factory ResultPageCubitState(
          [void Function(ResultPageCubitStateBuilder) updates]) =
      _$ResultPageCubitState;

  ResultPageCubitState._();

  Game get game;

  Player? get currentPlayer;

  bool get zombieWins => game.zombies.length == game.players.length;
}
