import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taggame/log.dart';
import 'package:taggame/utils/texts.dart';

const _tag = 'shared_preferences_service';

class SharedPreferencesRepository {
  SharedPreferencesRepository._();

  static SharedPreferencesRepository instance = SharedPreferencesRepository._();

  late final SharedPreferences _prefs;

  /// First start?
  static const _firstStartKey = 'FIRST_START';

  /// App locale
  static const _localeKey = 'LOCALE';

  late bool _isFirstStart;

  bool get isFirstStart => _isFirstStart;

  Future<void> init() async {
    Log.d(_tag, 'init');

    _prefs = await SharedPreferences.getInstance();

    _isFirstStart = _prefs.getBool(_firstStartKey) ?? true;
    Log.d(_tag, 'init: _isFirstStart = $_isFirstStart');
    await _prefs.setBool(_firstStartKey, false);
  }

  Future<bool> setLocale(Locale? value) {
    return _prefs.setStringSafe(_localeKey, value?.languageCode);
  }

  Locale? getLocale() {
    final locale = _prefs.getString(_localeKey);
    if (locale.isNullOrEmpty) return null;

    return Locale(locale!);
  }
}

extension SharedPreferencesEx on SharedPreferences {
  Future<bool> setBoolSafe(String key, bool? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setBool(key, value);
    }
  }

  Future<bool> setIntSafe(String key, int? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setInt(key, value);
    }
  }

  Future<bool> setStringSafe(String key, String? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setString(key, value);
    }
  }

  Future<bool> setStringListSafe(String key, List<String>? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setStringList(key, value);
    }
  }
}
