// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppCubitState extends AppCubitState {
  @override
  final Locale? overridedLocale;

  factory _$AppCubitState([void Function(AppCubitStateBuilder)? updates]) =>
      (new AppCubitStateBuilder()..update(updates))._build();

  _$AppCubitState._({this.overridedLocale}) : super._();

  @override
  AppCubitState rebuild(void Function(AppCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppCubitStateBuilder toBuilder() => new AppCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppCubitState && overridedLocale == other.overridedLocale;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, overridedLocale.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppCubitState')
          ..add('overridedLocale', overridedLocale))
        .toString();
  }
}

class AppCubitStateBuilder
    implements Builder<AppCubitState, AppCubitStateBuilder> {
  _$AppCubitState? _$v;

  Locale? _overridedLocale;
  Locale? get overridedLocale => _$this._overridedLocale;
  set overridedLocale(Locale? overridedLocale) =>
      _$this._overridedLocale = overridedLocale;

  AppCubitStateBuilder();

  AppCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _overridedLocale = $v.overridedLocale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppCubitState;
  }

  @override
  void update(void Function(AppCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppCubitState build() => _build();

  _$AppCubitState _build() {
    final _$result =
        _$v ?? new _$AppCubitState._(overridedLocale: overridedLocale);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
