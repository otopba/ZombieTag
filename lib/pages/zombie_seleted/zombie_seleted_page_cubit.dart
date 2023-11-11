import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/zombie_seleted/zombie_seleted_page_cubit_state.dart';

const _tag = 'zombie_seleted_page_cubit';

class ZombieSelectedPageCubit extends Cubit<ZombieSelectedPageCubitState> {
  ZombieSelectedPageCubit()
      : super(
          ZombieSelectedPageCubitState(
            (b) => b
              ..player = Player(
                (b) => b
                  ..id = '1'
                  ..name = 'Oliver'
                  ..rank = 'Newbie',
              ).toBuilder()
              ..ready = false,
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    await Future.delayed(const Duration(seconds: 3));

    if (isClosed) return;

    emit(state.rebuild((b) => b..ready = true));
  }
}
