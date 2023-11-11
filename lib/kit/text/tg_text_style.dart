import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taggame/kit/text/tg_text_style_android.dart';
import 'package:taggame/kit/text/tg_text_style_ios.dart';

abstract class TGTextStyle {
  static TGTextStyle instance = defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS
      ? TGTextStyleIOs()
      : TGTextStyleAndroid();

  TextStyle get gigant;

  TextStyle get styleH1;

  TextStyle get styleH2;

  TextStyle get styleH3;

  TextStyle get styleH4;

  TextStyle get style32;

  TextStyle get style30;

  TextStyle get style28Medium;

  TextStyle get style24;

  TextStyle get style22;

  TextStyle get style20;

  TextStyle get style18;

  TextStyle get style17;

  TextStyle get style17Semibold;

  TextStyle get style17Underlined;

  TextStyle get style15;

  TextStyle get style14;

  TextStyle get style14Semibold;

  TextStyle get style12;
}
