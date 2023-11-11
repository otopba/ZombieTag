// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RunPageCubitState extends RunPageCubitState {
  @override
  final bool showRun;
  @override
  final int count;
  @override
  final bool finish;

  factory _$RunPageCubitState(
          [void Function(RunPageCubitStateBuilder)? updates]) =>
      (new RunPageCubitStateBuilder()..update(updates))._build();

  _$RunPageCubitState._(
      {required this.showRun, required this.count, required this.finish})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        showRun, r'RunPageCubitState', 'showRun');
    BuiltValueNullFieldError.checkNotNull(count, r'RunPageCubitState', 'count');
    BuiltValueNullFieldError.checkNotNull(
        finish, r'RunPageCubitState', 'finish');
  }

  @override
  RunPageCubitState rebuild(void Function(RunPageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RunPageCubitStateBuilder toBuilder() =>
      new RunPageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RunPageCubitState &&
        showRun == other.showRun &&
        count == other.count &&
        finish == other.finish;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, showRun.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, finish.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RunPageCubitState')
          ..add('showRun', showRun)
          ..add('count', count)
          ..add('finish', finish))
        .toString();
  }
}

class RunPageCubitStateBuilder
    implements Builder<RunPageCubitState, RunPageCubitStateBuilder> {
  _$RunPageCubitState? _$v;

  bool? _showRun;
  bool? get showRun => _$this._showRun;
  set showRun(bool? showRun) => _$this._showRun = showRun;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  bool? _finish;
  bool? get finish => _$this._finish;
  set finish(bool? finish) => _$this._finish = finish;

  RunPageCubitStateBuilder();

  RunPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _showRun = $v.showRun;
      _count = $v.count;
      _finish = $v.finish;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RunPageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RunPageCubitState;
  }

  @override
  void update(void Function(RunPageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RunPageCubitState build() => _build();

  _$RunPageCubitState _build() {
    final _$result = _$v ??
        new _$RunPageCubitState._(
            showRun: BuiltValueNullFieldError.checkNotNull(
                showRun, r'RunPageCubitState', 'showRun'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'RunPageCubitState', 'count'),
            finish: BuiltValueNullFieldError.checkNotNull(
                finish, r'RunPageCubitState', 'finish'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
