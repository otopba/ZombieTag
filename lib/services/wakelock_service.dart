import 'package:taggame/log.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

const _tag = 'wakelock_service';

class WakelockService {
  WakelockService() {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  Future<void> enable() async {
    try {
      await WakelockPlus.enable();
    } catch (e, stackTrace) {
      Log.e(_tag, 'lock: $e', stackTrace: stackTrace);
    }
  }

  Future<void> disable() async {
    try {
      await WakelockPlus.disable();
    } catch (e, stackTrace) {
      Log.e(_tag, 'lock: $e', stackTrace: stackTrace);
    }
  }
}
