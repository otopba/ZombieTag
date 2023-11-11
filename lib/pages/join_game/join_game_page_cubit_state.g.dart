// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JoinGamePageCubitState extends JoinGamePageCubitState {
  @override
  final BuiltList<Player> players;

  factory _$JoinGamePageCubitState(
          [void Function(JoinGamePageCubitStateBuilder)? updates]) =>
      (new JoinGamePageCubitStateBuilder()..update(updates))._build();

  _$JoinGamePageCubitState._({required this.players}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        players, r'JoinGamePageCubitState', 'players');
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
    return other is JoinGamePageCubitState && players == other.players;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, players.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JoinGamePageCubitState')
          ..add('players', players))
        .toString();
  }
}

class JoinGamePageCubitStateBuilder
    implements Builder<JoinGamePageCubitState, JoinGamePageCubitStateBuilder> {
  _$JoinGamePageCubitState? _$v;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  JoinGamePageCubitStateBuilder();

  JoinGamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _players = $v.players.toBuilder();
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
      _$result =
          _$v ?? new _$JoinGamePageCubitState._(players: players.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'players';
        players.build();
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
