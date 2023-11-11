// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResultPageCubitState extends ResultPageCubitState {
  @override
  final Game game;
  @override
  final Player? currentPlayer;

  factory _$ResultPageCubitState(
          [void Function(ResultPageCubitStateBuilder)? updates]) =>
      (new ResultPageCubitStateBuilder()..update(updates))._build();

  _$ResultPageCubitState._({required this.game, this.currentPlayer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        game, r'ResultPageCubitState', 'game');
  }

  @override
  ResultPageCubitState rebuild(
          void Function(ResultPageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultPageCubitStateBuilder toBuilder() =>
      new ResultPageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResultPageCubitState &&
        game == other.game &&
        currentPlayer == other.currentPlayer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, game.hashCode);
    _$hash = $jc(_$hash, currentPlayer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResultPageCubitState')
          ..add('game', game)
          ..add('currentPlayer', currentPlayer))
        .toString();
  }
}

class ResultPageCubitStateBuilder
    implements Builder<ResultPageCubitState, ResultPageCubitStateBuilder> {
  _$ResultPageCubitState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  PlayerBuilder? _currentPlayer;
  PlayerBuilder get currentPlayer =>
      _$this._currentPlayer ??= new PlayerBuilder();
  set currentPlayer(PlayerBuilder? currentPlayer) =>
      _$this._currentPlayer = currentPlayer;

  ResultPageCubitStateBuilder();

  ResultPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game.toBuilder();
      _currentPlayer = $v.currentPlayer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResultPageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResultPageCubitState;
  }

  @override
  void update(void Function(ResultPageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResultPageCubitState build() => _build();

  _$ResultPageCubitState _build() {
    _$ResultPageCubitState _$result;
    try {
      _$result = _$v ??
          new _$ResultPageCubitState._(
              game: game.build(), currentPlayer: _currentPlayer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        game.build();
        _$failedField = 'currentPlayer';
        _currentPlayer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResultPageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
