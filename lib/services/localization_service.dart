import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taggame/log.dart';
import 'package:taggame/repos/shared_preferences_repository.dart';
import 'package:taggame/utils/texts.dart';

const _tag = 'localization_service';

typedef LocalizedString = String Function(AppLocalizations appLocalizations);

class LocalizationService {
  static const enLocale = Locale('en', '');

  static const defaultLocale = enLocale;

  static const supportedLocales = [
    enLocale,
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final SharedPreferencesRepository _prefs;
  final _localeSubject = BehaviorSubject<Locale>();

  Stream<Locale> get localeStream => _localeSubject.distinct();

  LocalizationService({
    required SharedPreferencesRepository prefs,
  }) : _prefs = prefs {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');

    final currentLocale = _prefs.getLocale() ?? _getPlatformLocale();
    _localeSubject.add(currentLocale);
  }

  Future<void> dispose() async {
    Log.d(_tag, 'dispose');

    await _localeSubject.close();
  }

  Locale _getPlatformLocale() {
    Log.d(_tag, '_getPlatformLocale');

    String localeName;
    try {
      localeName = Platform.localeName;
    } catch (ex) {
      Log.e(_tag, "_getPlatformLocale: Can't get locale from platform");
      return defaultLocale;
    }

    if (localeName.isNullOrEmpty) {
      Log.d(_tag, '_getPlatformLocale: Locale name isNullOrEmpty');
      return defaultLocale;
    }

    final parts = localeName.split('_');
    if (parts.length != 2) {
      Log.d(_tag, '_getPlatformLocale: Locale has wrong format');
      return defaultLocale;
    }

    final languageCode = parts[0];
    final countryCode = parts[1];
    if (languageCode.isNullOrEmpty) {
      Log.d(_tag, '_getPlatformLocale: Language code is wrong');
      return defaultLocale;
    } else {
      Log.d(
        _tag,
        '_getPlatformLocale: languageCode = $languageCode, countryCode = $countryCode',
      );

      final locale = Locale(languageCode, '');

      if (supportedLocales.contains(locale)) {
        return locale;
      } else {
        Log.d(
          _tag,
          '_getPlatformLocale: unsupported locale. return default',
        );
        return defaultLocale;
      }
    }
  }

  Locale localeListResolutionCallback(
      List<Locale>? locales,
      Iterable<Locale> supportedLocales,
      ) {
    final locale = basicLocaleListResolution(locales, supportedLocales);
    Log.d(_tag, "Set locale $locale");

    _localeSubject.add(locale);

    return locale;
  }

  Future<AppLocalizations> getLocalization({Locale? locale}) {
    return AppLocalizations.delegate.load(locale ?? getCurrentLocale());
  }

  Locale getCurrentLocale() {
    return _localeSubject.valueOrNull ?? _getPlatformLocale();
  }

  Future<void> setLocale(Locale locale) async {
    Log.d(_tag, "Set locale $locale");

    await _prefs.setLocale(locale);
    _localeSubject.add(locale);
  }
}

extension ContextAppLocale on BuildContext {
  AppLocalizations get localization =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}

extension LocaleEx on Locale {
  String getLanguageName(AppLocalizations localization) {
    if (languageCode == LocalizationService.enLocale.languageCode) {
      return localization.english;
    } else {
      return localization.unknown;
    }
  }
}
