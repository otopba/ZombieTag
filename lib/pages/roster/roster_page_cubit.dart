import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/pages/roster/roster_page_cubit_state.dart';

const _tag = 'roster_page_cubit';

class RosterPageCubit extends Cubit<RosterPageCubitState> {
  RosterPageCubit({
    required Game game,
  }) : super(
          RosterPageCubitState(
            (b) => b
              ..game = game.toBuilder()
              ..spinning = false,
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    await Future.delayed(const Duration(seconds: 1));

    if (isClosed) return;

    emit(state.rebuild((b) => b..spinning = true));

    await Future.delayed(const Duration(seconds: 3));

    if (isClosed) return;

    emit(state.rebuild((b) => b..spinning = false));
  }
}
