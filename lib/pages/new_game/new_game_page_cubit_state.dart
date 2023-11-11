import 'package:built_value/built_value.dart';
import 'package:taggame/models/player.dart';
import 'package:built_collection/built_collection.dart';

part 'new_game_page_cubit_state.g.dart';

abstract class NewGamePageCubitState
    implements Built<NewGamePageCubitState, NewGamePageCubitStateBuilder> {
  factory NewGamePageCubitState(
          [void Function(NewGamePageCubitStateBuilder) updates]) =
      _$NewGamePageCubitState;

  NewGamePageCubitState._();

  BuiltList<Player> get players;
}
