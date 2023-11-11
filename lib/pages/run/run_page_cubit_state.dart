import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';

part 'run_page_cubit_state.g.dart';

abstract class RunPageCubitState
    implements Built<RunPageCubitState, RunPageCubitStateBuilder> {
  factory RunPageCubitState(
          [void Function(RunPageCubitStateBuilder) updates]) =
      _$RunPageCubitState;

  RunPageCubitState._();

  Game get game;

  bool get showRun;

  int get count;

  bool get finish;

  bool get currentPlayerZombie;
}
