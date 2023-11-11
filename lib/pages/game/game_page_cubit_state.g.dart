// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GamePageCubitState extends GamePageCubitState {
  @override
  final Game game;
  @override
  final bool currentPlayerZombie;
  @override
  final Player? newZombie;
  @override
  final int count;

  factory _$GamePageCubitState(
          [void Function(GamePageCubitStateBuilder)? updates]) =>
      (new GamePageCubitStateBuilder()..update(updates))._build();

  _$GamePageCubitState._(
      {required this.game,
      required this.currentPlayerZombie,
      this.newZombie,
      required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(game, r'GamePageCubitState', 'game');
    BuiltValueNullFieldError.checkNotNull(
        currentPlayerZombie, r'GamePageCubitState', 'currentPlayerZombie');
    BuiltValueNullFieldError.checkNotNull(
        count, r'GamePageCubitState', 'count');
  }

  @override
  GamePageCubitState rebuild(
          void Function(GamePageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GamePageCubitStateBuilder toBuilder() =>
      new GamePageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GamePageCubitState &&
        game == other.game &&
        currentPlayerZombie == other.currentPlayerZombie &&
        newZombie == other.newZombie &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, game.hashCode);
    _$hash = $jc(_$hash, currentPlayerZombie.hashCode);
    _$hash = $jc(_$hash, newZombie.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GamePageCubitState')
          ..add('game', game)
          ..add('currentPlayerZombie', currentPlayerZombie)
          ..add('newZombie', newZombie)
          ..add('count', count))
        .toString();
  }
}

class GamePageCubitStateBuilder
    implements Builder<GamePageCubitState, GamePageCubitStateBuilder> {
  _$GamePageCubitState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  bool? _currentPlayerZombie;
  bool? get currentPlayerZombie => _$this._currentPlayerZombie;
  set currentPlayerZombie(bool? currentPlayerZombie) =>
      _$this._currentPlayerZombie = currentPlayerZombie;

  PlayerBuilder? _newZombie;
  PlayerBuilder get newZombie => _$this._newZombie ??= new PlayerBuilder();
  set newZombie(PlayerBuilder? newZombie) => _$this._newZombie = newZombie;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GamePageCubitStateBuilder();

  GamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game.toBuilder();
      _currentPlayerZombie = $v.currentPlayerZombie;
      _newZombie = $v.newZombie?.toBuilder();
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GamePageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GamePageCubitState;
  }

  @override
  void update(void Function(GamePageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GamePageCubitState build() => _build();

  _$GamePageCubitState _build() {
    _$GamePageCubitState _$result;
    try {
      _$result = _$v ??
          new _$GamePageCubitState._(
              game: game.build(),
              currentPlayerZombie: BuiltValueNullFieldError.checkNotNull(
                  currentPlayerZombie,
                  r'GamePageCubitState',
                  'currentPlayerZombie'),
              newZombie: _newZombie?.build(),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, r'GamePageCubitState', 'count'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        game.build();

        _$failedField = 'newZombie';
        _newZombie?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GamePageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
