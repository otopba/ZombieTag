import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'roster_page_cubit_state.g.dart';

abstract class RosterPageCubitState
    implements Built<RosterPageCubitState, RosterPageCubitStateBuilder> {
  factory RosterPageCubitState(
          [void Function(RosterPageCubitStateBuilder) updates]) =
      _$RosterPageCubitState;

  RosterPageCubitState._();

  Game get game;

  bool get spinning;
}
