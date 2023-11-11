// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JoinGamePageCubitState extends JoinGamePageCubitState {
  @override
  final BuiltList<Game> games;
  @override
  final Game? selectedGame;

  factory _$JoinGamePageCubitState(
          [void Function(JoinGamePageCubitStateBuilder)? updates]) =>
      (new JoinGamePageCubitStateBuilder()..update(updates))._build();

  _$JoinGamePageCubitState._({required this.games, this.selectedGame})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        games, r'JoinGamePageCubitState', 'games');
  }

  @override
  JoinGamePageCubitState rebuild(
          void Function(JoinGamePageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JoinGamePageCubitStateBuilder toBuilder() =>
      new JoinGamePageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JoinGamePageCubitState &&
        games == other.games &&
        selectedGame == other.selectedGame;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, games.hashCode);
    _$hash = $jc(_$hash, selectedGame.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JoinGamePageCubitState')
          ..add('games', games)
          ..add('selectedGame', selectedGame))
        .toString();
  }
}

class JoinGamePageCubitStateBuilder
    implements Builder<JoinGamePageCubitState, JoinGamePageCubitStateBuilder> {
  _$JoinGamePageCubitState? _$v;

  ListBuilder<Game>? _games;
  ListBuilder<Game> get games => _$this._games ??= new ListBuilder<Game>();
  set games(ListBuilder<Game>? games) => _$this._games = games;

  GameBuilder? _selectedGame;
  GameBuilder get selectedGame => _$this._selectedGame ??= new GameBuilder();
  set selectedGame(GameBuilder? selectedGame) =>
      _$this._selectedGame = selectedGame;

  JoinGamePageCubitStateBuilder();

  JoinGamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _games = $v.games.toBuilder();
      _selectedGame = $v.selectedGame?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JoinGamePageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JoinGamePageCubitState;
  }

  @override
  void update(void Function(JoinGamePageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JoinGamePageCubitState build() => _build();

  _$JoinGamePageCubitState _build() {
    _$JoinGamePageCubitState _$result;
    try {
      _$result = _$v ??
          new _$JoinGamePageCubitState._(
              games: games.build(), selectedGame: _selectedGame?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'games';
        games.build();
        _$failedField = 'selectedGame';
        _selectedGame?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'JoinGamePageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
