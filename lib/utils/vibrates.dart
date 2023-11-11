import 'package:flutter/foundation.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

bool? googlePixel;

Future<bool> canVibrate() async {
  return true;
}

Future<void> vibrateError() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }
  Vibrate.feedback(FeedbackType.error);
}

Future<void> vibrateSuccess() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }
  Vibrate.feedback(FeedbackType.success);
}

Future<void> vibrateHeavy() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }
  Vibrate.feedback(FeedbackType.heavy);
}

Future<void> vibrateMedium() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    Vibrate.feedback(FeedbackType.light);
  } else {
    Vibrate.feedback(FeedbackType.medium);
  }
}

Future<void> vibrateLight() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }

  Vibrate.feedback(FeedbackType.light);
}

Future<void> vibrateSelection() async {
  final vibrate = await canVibrate();
  if (!vibrate) {
    return;
  }

  Vibrate.feedback(FeedbackType.selection);
}
