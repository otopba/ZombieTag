import 'package:built_value/built_value.dart';

part 'home_page_cubit_state.g.dart';

abstract class HomePageCubitState
    implements Built<HomePageCubitState, HomePageCubitStateBuilder> {
  factory HomePageCubitState(
          [void Function(HomePageCubitStateBuilder) updates]) =
      _$HomePageCubitState;

  HomePageCubitState._();
}
