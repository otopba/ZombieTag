// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewGamePageCubitState extends NewGamePageCubitState {
  @override
  final Game game;
  @override
  final Player? currentPlayer;
  @override
  final bool loading;

  factory _$NewGamePageCubitState(
          [void Function(NewGamePageCubitStateBuilder)? updates]) =>
      (new NewGamePageCubitStateBuilder()..update(updates))._build();

  _$NewGamePageCubitState._(
      {required this.game, this.currentPlayer, required this.loading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        game, r'NewGamePageCubitState', 'game');
    BuiltValueNullFieldError.checkNotNull(
        loading, r'NewGamePageCubitState', 'loading');
  }

  @override
  NewGamePageCubitState rebuild(
          void Function(NewGamePageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewGamePageCubitStateBuilder toBuilder() =>
      new NewGamePageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewGamePageCubitState &&
        game == other.game &&
        currentPlayer == other.currentPlayer &&
        loading == other.loading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, game.hashCode);
    _$hash = $jc(_$hash, currentPlayer.hashCode);
    _$hash = $jc(_$hash, loading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewGamePageCubitState')
          ..add('game', game)
          ..add('currentPlayer', currentPlayer)
          ..add('loading', loading))
        .toString();
  }
}

class NewGamePageCubitStateBuilder
    implements Builder<NewGamePageCubitState, NewGamePageCubitStateBuilder> {
  _$NewGamePageCubitState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  PlayerBuilder? _currentPlayer;
  PlayerBuilder get currentPlayer =>
      _$this._currentPlayer ??= new PlayerBuilder();
  set currentPlayer(PlayerBuilder? currentPlayer) =>
      _$this._currentPlayer = currentPlayer;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  NewGamePageCubitStateBuilder();

  NewGamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game.toBuilder();
      _currentPlayer = $v.currentPlayer?.toBuilder();
      _loading = $v.loading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewGamePageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewGamePageCubitState;
  }

  @override
  void update(void Function(NewGamePageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewGamePageCubitState build() => _build();

  _$NewGamePageCubitState _build() {
    _$NewGamePageCubitState _$result;
    try {
      _$result = _$v ??
          new _$NewGamePageCubitState._(
              game: game.build(),
              currentPlayer: _currentPlayer?.build(),
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'NewGamePageCubitState', 'loading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        game.build();
        _$failedField = 'currentPlayer';
        _currentPlayer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NewGamePageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
