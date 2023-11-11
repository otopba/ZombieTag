import 'package:flutter/services.dart';
import 'package:taggame/log.dart';

const _tag = 'location_service';

class LocationService {
  LocationService() {
    _init();
  }

  static const platformChannel = MethodChannel('com.example/my_channel');

  Future<void> _init() async {
    Log.d(_tag, '_init');

    await Future.delayed(const Duration(seconds: 2));

    await getNativeData();
  }

  Future<void> getNativeData() async {
    Log.d(_tag, 'getNativeData');

    try {
      final result = await platformChannel.invokeMethod('getNativeData');
      Log.d(_tag, 'result = $result');
    } on PlatformException catch (e, stackTrace) {
      Log.e(_tag, 'getNativeData: $e', stackTrace: stackTrace);
    }
  }
}
