import 'package:flutter/material.dart';

class TGColors {
  final bool darkMode;

  TGColors._(this.darkMode)
      : accentColor = _getAccentColor(darkMode),
        accentColorNew =
            darkMode ? greenForWhiteColor : const Color(0xFF00D93D),
        backgroundColor = darkMode ? blackColor : whiteColor,
        primaryTextColor = darkMode ? whiteColor : blackColor,
        secondaryTextColor = darkMode ? whiteOp50Color : blackOp40Color,
        switchTrackColor = darkMode ? whiteOp20Color : whiteOp20Color,
        switchThumbColor = darkMode ? purpleColor : purpleColor,
        listRowBackgroundColor =
            darkMode ? whiteColor.withOpacity(0.02) : strokeColor,
        inactiveTrackColor = darkMode ? bgDarkColor : strokeColor,
        likeBorderColor =
            darkMode ? strokeColor.withOpacity(0.15) : strokeColor,
        appDeprecatedCircleColor = darkMode ? whiteOp5Color : strokeColor,
        listItemBackgroundColor = darkMode ? bgDarkColor : strokeColor,
        wordCardBackgroundColor = darkMode ? bgDarkColor : whiteColor,
        feedBackgroundColor = darkMode ? blackColor : bgGrayColor,
        switchBackgroundColor =
            darkMode ? whiteColor.withOpacity(0.28) : strokeColor,
        highlightTextColor = darkMode ? Colors.white : Colors.black,
        popupMenuSeparator = darkMode
            ? const Color(0xFF545458).withOpacity(0.65)
            : const Color(0xFF3C3C43).withOpacity(0.36),
        menuDevIconColor = darkMode ? _getAccentColor(darkMode) : blackColor,
        menuDevTextColor =
            darkMode ? _getAccentColor(darkMode) : blackOp40Color,
        writeUsDotOutsideColor = darkMode
            ? _getAccentColor(darkMode).withOpacity(0.2)
            : blackColor.withOpacity(0.1),
        writeUsDotInsideColor =
            darkMode ? _getAccentColor(darkMode) : blackColor,
        learnTokensFrontCardColor = darkMode ? whiteColor : blackColor,
        learnTokensFrontLanguageColor =
            darkMode ? blackOp40Color : whiteColor.withOpacity(0.4),
        learnTokensFrontTextColor = darkMode ? blackColor : whiteColor,
        learnTokensFrontTTSColor = darkMode ? strokeColor : bgDarkColor,
        learnTokensBackLanguageColor =
            darkMode ? whiteColor.withOpacity(0.4) : bgDarkColor,
        learnTokensBackCardColor = darkMode ? bgDarkColor : strokeColor,
        learnTokensBackTextColor = darkMode ? whiteColor : blackColor,
        learnTokensBackTTSColor =
            darkMode ? whiteColor.withOpacity(0.02) : whiteColor;

  static Color _getAccentColor(bool darkMode) =>
      darkMode ? greenColor : greenForWhiteColor;

  static const orangeColor = Color(0xFFFFBE99);
  static const pinkColor = Color(0xFFF47FB9);
  static const purpleColor = Color(0xFF6955D4);
  static const redSaleColor = Color(0xFFFF8A8A);
  static const redColor = Color(0xFFFE524E);
  static final redOp10Color = redColor.withOpacity(0.1);
  static const blackColor = Color(0xFF000000);
  static final blackOp90Color = blackColor.withOpacity(0.9);
  static final blackOp40Color = blackColor.withOpacity(0.4);
  static const bgDarkColor = Color(0xFF191919);
  static const bgGrayColor = Color(0xFFE8E8E8);
  static const greenColor = Color(0xFF68FF85);
  static const greenForWhiteColor = Color(0xFF4DF66E);
  static const mainColor = Color(0xFFFFE999);
  static const whiteColor = Color(0xFFFFFFFF);
  static final whiteOp50Color = whiteColor.withOpacity(0.5);
  static final whiteOp20Color = whiteColor.withOpacity(0.2);
  static final whiteOp5Color = whiteColor.withOpacity(0.05);
  static const strokeColor = Color(0xFFF4F4F4);
  static const cupertinoMenuColor = Color(0xFF007AFF);

  final Color accentColor;
  final Color accentColorNew;
  final Color backgroundColor;
  final Color highlightColor = const Color(0xFFC7C7C7).withOpacity(0.15);
  final Color splashColor = const Color(0xFFC7C7C7).withOpacity(0.2);
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color switchTrackColor;
  final Color switchThumbColor;
  final Color listRowBackgroundColor;
  final Color inactiveTrackColor;
  final Color likeBorderColor;
  final Color appDeprecatedCircleColor;

  // Dark Gray for Black
  final Color listItemBackgroundColor;
  final Color wordCardBackgroundColor;
  final Color feedBackgroundColor;
  final Color switchBackgroundColor;
  final Color highlightTextColor;
  final Color popupMenuSeparator;
  final Color menuDevIconColor;
  final Color menuDevTextColor;
  final Color writeUsDotOutsideColor;
  final Color writeUsDotInsideColor;
  final Color learnTokensFrontCardColor;
  final Color learnTokensFrontLanguageColor;
  final Color learnTokensFrontTextColor;
  final Color learnTokensFrontTTSColor;
  final Color learnTokensBackLanguageColor;
  final Color learnTokensBackCardColor;
  final Color learnTokensBackTextColor;
  final Color learnTokensBackTTSColor;

  static final TGColors lightColors = TGColors._(false);
  static final TGColors darkColors = TGColors._(true);

  static TGColors of(BuildContext context) {
    return isLightTheme(context) ? lightColors : darkColors;
  }

  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}
