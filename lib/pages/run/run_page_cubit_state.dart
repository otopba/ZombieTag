import 'package:built_value/built_value.dart';

part 'run_page_cubit_state.g.dart';

abstract class RunPageCubitState
    implements Built<RunPageCubitState, RunPageCubitStateBuilder> {
  factory RunPageCubitState(
          [void Function(RunPageCubitStateBuilder) updates]) =
      _$RunPageCubitState;

  RunPageCubitState._();

  bool get showRun;

  int get count;

  bool get finish;
}
