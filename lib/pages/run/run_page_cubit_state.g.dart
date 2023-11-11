// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RunPageCubitState extends RunPageCubitState {
  @override
  final Game game;
  @override
  final bool showRun;
  @override
  final int count;
  @override
  final bool finish;
  @override
  final bool currentPlayerZombie;

  factory _$RunPageCubitState(
          [void Function(RunPageCubitStateBuilder)? updates]) =>
      (new RunPageCubitStateBuilder()..update(updates))._build();

  _$RunPageCubitState._(
      {required this.game,
      required this.showRun,
      required this.count,
      required this.finish,
      required this.currentPlayerZombie})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(game, r'RunPageCubitState', 'game');
    BuiltValueNullFieldError.checkNotNull(
        showRun, r'RunPageCubitState', 'showRun');
    BuiltValueNullFieldError.checkNotNull(count, r'RunPageCubitState', 'count');
    BuiltValueNullFieldError.checkNotNull(
        finish, r'RunPageCubitState', 'finish');
    BuiltValueNullFieldError.checkNotNull(
        currentPlayerZombie, r'RunPageCubitState', 'currentPlayerZombie');
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
        game == other.game &&
        showRun == other.showRun &&
        count == other.count &&
        finish == other.finish &&
        currentPlayerZombie == other.currentPlayerZombie;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, game.hashCode);
    _$hash = $jc(_$hash, showRun.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, finish.hashCode);
    _$hash = $jc(_$hash, currentPlayerZombie.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RunPageCubitState')
          ..add('game', game)
          ..add('showRun', showRun)
          ..add('count', count)
          ..add('finish', finish)
          ..add('currentPlayerZombie', currentPlayerZombie))
        .toString();
  }
}

class RunPageCubitStateBuilder
    implements Builder<RunPageCubitState, RunPageCubitStateBuilder> {
  _$RunPageCubitState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  bool? _showRun;
  bool? get showRun => _$this._showRun;
  set showRun(bool? showRun) => _$this._showRun = showRun;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  bool? _finish;
  bool? get finish => _$this._finish;
  set finish(bool? finish) => _$this._finish = finish;

  bool? _currentPlayerZombie;
  bool? get currentPlayerZombie => _$this._currentPlayerZombie;
  set currentPlayerZombie(bool? currentPlayerZombie) =>
      _$this._currentPlayerZombie = currentPlayerZombie;

  RunPageCubitStateBuilder();

  RunPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game.toBuilder();
      _showRun = $v.showRun;
      _count = $v.count;
      _finish = $v.finish;
      _currentPlayerZombie = $v.currentPlayerZombie;
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
    _$RunPageCubitState _$result;
    try {
      _$result = _$v ??
          new _$RunPageCubitState._(
              game: game.build(),
              showRun: BuiltValueNullFieldError.checkNotNull(
                  showRun, r'RunPageCubitState', 'showRun'),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, r'RunPageCubitState', 'count'),
              finish: BuiltValueNullFieldError.checkNotNull(
                  finish, r'RunPageCubitState', 'finish'),
              currentPlayerZombie: BuiltValueNullFieldError.checkNotNull(
                  currentPlayerZombie,
                  r'RunPageCubitState',
                  'currentPlayerZombie'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        game.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RunPageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
