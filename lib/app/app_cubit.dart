import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/app/app_cubit_state.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/repos/shared_preferences_repository.dart';
import 'package:taggame/services/localization_service.dart';
import 'package:taggame/services/navigator/router_service.dart';

const _tag = 'app_cubit';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit()
      : _localizationService = di.get(),
        _prefs = di.get(),
        _routerService = di.get(),
        super(
          AppCubitState(
            (b) => b
              ..overridedLocale =
                  di.get<SharedPreferencesRepository>().getLocale(),
          ),
        ) {
    _init();
  }

  final LocalizationService _localizationService;
  final SharedPreferencesRepository _prefs;
  final RouterService _routerService;

  late final StreamSubscription _localeSubscription;

  RouterConfig<Object> get routerConfig => _routerService.router;

  void _init() {
    Log.d(_tag, '_init');

    _localeSubscription = _localizationService.localeStream.listen(_onLocale);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _localeSubscription.cancel();
  }

  void _onLocale(Locale locale) {
    Log.d(_tag, '_onLanguage: locale = $locale');

    if (isClosed) return;

    emit(
      state.rebuild((b) => b..overridedLocale = _prefs.getLocale()),
    );
  }

  Locale localeListResolutionCallback(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
  ) {
    return _localizationService.localeListResolutionCallback(
      locales,
      supportedLocales,
    );
  }
}
