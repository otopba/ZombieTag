// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_lobby_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameLobbyPageCubitState extends GameLobbyPageCubitState {
  @override
  final Game? game;
  @override
  final Player? currentPlayer;

  factory _$GameLobbyPageCubitState(
          [void Function(GameLobbyPageCubitStateBuilder)? updates]) =>
      (new GameLobbyPageCubitStateBuilder()..update(updates))._build();

  _$GameLobbyPageCubitState._({this.game, this.currentPlayer}) : super._();

  @override
  GameLobbyPageCubitState rebuild(
          void Function(GameLobbyPageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameLobbyPageCubitStateBuilder toBuilder() =>
      new GameLobbyPageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameLobbyPageCubitState &&
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
    return (newBuiltValueToStringHelper(r'GameLobbyPageCubitState')
          ..add('game', game)
          ..add('currentPlayer', currentPlayer))
        .toString();
  }
}

class GameLobbyPageCubitStateBuilder
    implements
        Builder<GameLobbyPageCubitState, GameLobbyPageCubitStateBuilder> {
  _$GameLobbyPageCubitState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  PlayerBuilder? _currentPlayer;
  PlayerBuilder get currentPlayer =>
      _$this._currentPlayer ??= new PlayerBuilder();
  set currentPlayer(PlayerBuilder? currentPlayer) =>
      _$this._currentPlayer = currentPlayer;

  GameLobbyPageCubitStateBuilder();

  GameLobbyPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game?.toBuilder();
      _currentPlayer = $v.currentPlayer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameLobbyPageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameLobbyPageCubitState;
  }

  @override
  void update(void Function(GameLobbyPageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameLobbyPageCubitState build() => _build();

  _$GameLobbyPageCubitState _build() {
    _$GameLobbyPageCubitState _$result;
    try {
      _$result = _$v ??
          new _$GameLobbyPageCubitState._(
              game: _game?.build(), currentPlayer: _currentPlayer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        _game?.build();
        _$failedField = 'currentPlayer';
        _currentPlayer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameLobbyPageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
