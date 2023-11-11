import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/roster/roster_page_cubit_state.dart';

const _tag = 'roster_page_cubit';

class RosterPageCubit extends Cubit<RosterPageCubitState> {
  RosterPageCubit()
      : super(
          RosterPageCubitState(
            (b) => b
              ..players = ListBuilder<Player>(
                [
                  Player(
                    (b) => b
                      ..id = '1'
                      ..name = 'Oliver'
                      ..rank = 'Newbie',
                  ),
                  Player(
                    (b) => b
                      ..id = '2'
                      ..name = 'Emily'
                      ..rank = 'Super runner',
                  ),
                  Player(
                    (b) => b
                      ..id = '3'
                      ..name = 'Jacob'
                      ..rank = 'Professional',
                  ),
                ],
              )
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
