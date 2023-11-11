import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/run/run_page_cubit_state.dart';

const _tag = 'run_page_cubit';

class RunPageCubit extends Cubit<RunPageCubitState> {
  static const _totalCount = 10;

  RunPageCubit()
      : super(
          RunPageCubitState(
            (b) => b
              ..showRun = false
              ..count = _totalCount
              ..finish = false,
          ),
        ) {
    _init();
  }

  Timer? _timer;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    await Future.delayed(const Duration(seconds: 4));

    if (isClosed) return;

    emit(state.rebuild((b) => b..showRun = true));

    _startTimer();
  }

  @override
  Future<void> close() async {
    await super.close();
    _timer?.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onCount,
    );
  }

  void _onCount(Timer timer) {
    if (isClosed) return;

    emit(state.rebuild((b) => b..count = max(0, state.count - 1)));

    if (state.count == 0) {
      emit(state.rebuild((b) => b..finish = true));
      _timer?.cancel();
    }
  }
}
