import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;

part 'app_cubit_state.g.dart';

abstract class AppCubitState
    implements Built<AppCubitState, AppCubitStateBuilder> {
  factory AppCubitState([void Function(AppCubitStateBuilder) updates]) =
      _$AppCubitState;

  AppCubitState._();

  /// Only the locale is written here if the user himself has chosen its
  /// application interface
  Locale? get overridedLocale;
}
