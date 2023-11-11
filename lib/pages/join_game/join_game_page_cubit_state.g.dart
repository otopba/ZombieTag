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
  @override
  final bool loading;
  @override
  final bool finish;
  @override
  final Player? currentPlayer;

  factory _$JoinGamePageCubitState(
          [void Function(JoinGamePageCubitStateBuilder)? updates]) =>
      (new JoinGamePageCubitStateBuilder()..update(updates))._build();

  _$JoinGamePageCubitState._(
      {required this.games,
      this.selectedGame,
      required this.loading,
      required this.finish,
      this.currentPlayer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        games, r'JoinGamePageCubitState', 'games');
    BuiltValueNullFieldError.checkNotNull(
        loading, r'JoinGamePageCubitState', 'loading');
    BuiltValueNullFieldError.checkNotNull(
        finish, r'JoinGamePageCubitState', 'finish');
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
        selectedGame == other.selectedGame &&
        loading == other.loading &&
        finish == other.finish &&
        currentPlayer == other.currentPlayer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, games.hashCode);
    _$hash = $jc(_$hash, selectedGame.hashCode);
    _$hash = $jc(_$hash, loading.hashCode);
    _$hash = $jc(_$hash, finish.hashCode);
    _$hash = $jc(_$hash, currentPlayer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JoinGamePageCubitState')
          ..add('games', games)
          ..add('selectedGame', selectedGame)
          ..add('loading', loading)
          ..add('finish', finish)
          ..add('currentPlayer', currentPlayer))
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

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  bool? _finish;
  bool? get finish => _$this._finish;
  set finish(bool? finish) => _$this._finish = finish;

  PlayerBuilder? _currentPlayer;
  PlayerBuilder get currentPlayer =>
      _$this._currentPlayer ??= new PlayerBuilder();
  set currentPlayer(PlayerBuilder? currentPlayer) =>
      _$this._currentPlayer = currentPlayer;

  JoinGamePageCubitStateBuilder();

  JoinGamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _games = $v.games.toBuilder();
      _selectedGame = $v.selectedGame?.toBuilder();
      _loading = $v.loading;
      _finish = $v.finish;
      _currentPlayer = $v.currentPlayer?.toBuilder();
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
              games: games.build(),
              selectedGame: _selectedGame?.build(),
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'JoinGamePageCubitState', 'loading'),
              finish: BuiltValueNullFieldError.checkNotNull(
                  finish, r'JoinGamePageCubitState', 'finish'),
              currentPlayer: _currentPlayer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'games';
        games.build();
        _$failedField = 'selectedGame';
        _selectedGame?.build();

        _$failedField = 'currentPlayer';
        _currentPlayer?.build();
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
