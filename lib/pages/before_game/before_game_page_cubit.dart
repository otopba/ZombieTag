import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/before_game/before_game_page_cubit_state.dart';

const _tag = 'before_game_page_cubit';

class BeforeGamePageCubit extends Cubit<BeforeGamePageCubitState> {
  BeforeGamePageCubit()
      : super(
          BeforeGamePageCubitState((b) => b),
        ) {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }
}
