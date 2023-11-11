import 'package:built_value/built_value.dart';

part 'before_game_page_cubit_state.g.dart';

abstract class BeforeGamePageCubitState
    implements Built<BeforeGamePageCubitState, BeforeGamePageCubitStateBuilder> {
  factory BeforeGamePageCubitState(
          [void Function(BeforeGamePageCubitStateBuilder) updates]) =
      _$BeforeGamePageCubitState;

  BeforeGamePageCubitState._();
}
