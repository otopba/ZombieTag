import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taggame/di.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/services/analytics/analytics_service.dart';
import 'package:taggame/services/localization_service.dart';

mixin TGPageStateMixin<T extends StatefulWidget> on State<T> {
  late TGColors _colors;
  late AppLocalizations _localizations;
  late final AnalyticsService _analytics = di.get();

  @protected
  TGColors get colors => _colors;

  @protected
  AppLocalizations get localizations => _localizations;

  @protected
  AnalyticsService get analytics => _analytics;

  CompositeSubscription? _subscriptions;

  bool _rootColors = false;

  @override
  void dispose() {
    _subscriptions?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateColors();
    _localizations = context.localization;
  }

  void collectStreamSubscription(StreamSubscription subscription) {
    final subscriptions = _subscriptions ?? CompositeSubscription();
    subscriptions.add<dynamic>(subscription);
    _subscriptions = subscriptions;
  }

  void _updateColors() {
    _colors = _rootColors
        ? TGColors.of(
            context.findRootAncestorStateOfType<NavigatorState>()!.context,
          )
        : TGColors.of(context);
  }

  void setRootColors(bool rootColors) {
    if (_rootColors == rootColors) return;

    _rootColors = rootColors;
    _updateColors();
  }
}
