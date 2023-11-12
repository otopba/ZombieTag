import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:taggame/log.dart';

const _tag = 'step_count_service';

class StepCountService {
  StepCountService() {
    _init();
  }

  late final StreamSubscription _pedestrianStatusSubscription;
  StreamSubscription? _stepCountSubscription;

  int? _startStepCount;
  int _currentStepCount = 0;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _pedestrianStatusSubscription = Pedometer.pedestrianStatusStream.listen(
      _onPedestrianStatus,
      onError: _onPedestrianStatusError,
    );
  }

  Future<void> dispose() async {
    await _pedestrianStatusSubscription.cancel();
    await _stepCountSubscription?.cancel();
  }

  void _onPedestrianStatus(PedestrianStatus status) {
    Log.d(_tag, '_onPedestrianStatus: status = $status');
  }

  void _onPedestrianStatusError(Object error, StackTrace stackTrace) {
    Log.e(
      _tag,
      '_onPedestrianStatusError: error = $error',
      stackTrace: stackTrace,
    );
  }

  Future<void> start() async {
    Log.d(_tag, 'start');

    await _stepCountSubscription?.cancel();

    _stepCountSubscription = Pedometer.stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountStreamError,
    );
  }

  Future<int> stop() async {
    Log.d(_tag, 'stop');

    await _stepCountSubscription?.cancel();

    return _currentStepCount;
  }

  void _onStepCount(StepCount stepCount) {
    Log.d(_tag, '_onStepCount: stepCount = $stepCount');

    _startStepCount ??= stepCount.steps;

    _currentStepCount = stepCount.steps - _startStepCount!;
  }

  void _onStepCountStreamError(Object error, StackTrace? stackTrace) {
    Log.e(
      _tag,
      '_onStepCountStreamError: error = $error',
      stackTrace: stackTrace,
    );
  }
}
