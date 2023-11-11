import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Throttler {
  Throttler(
    VoidCallback function, {
    this.duration = const Duration(milliseconds: 300),
  }) : _function = function;

  final Duration duration;
  final VoidCallback _function;
  DateTime? _lastEventTime;

  VoidCallback get throttle {
    return () {
      final now = DateTime.now();
      if (_lastEventTime != null &&
          now.difference(_lastEventTime!) < duration) {
        return;
      }
      _lastEventTime = now;

      _function();
    };
  }
}
