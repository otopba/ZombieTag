// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewGamePageCubitState extends NewGamePageCubitState {
  @override
  final BuiltList<Player> players;

  factory _$NewGamePageCubitState(
          [void Function(NewGamePageCubitStateBuilder)? updates]) =>
      (new NewGamePageCubitStateBuilder()..update(updates))._build();

  _$NewGamePageCubitState._({required this.players}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        players, r'NewGamePageCubitState', 'players');
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
    return other is NewGamePageCubitState && players == other.players;
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
    return (newBuiltValueToStringHelper(r'NewGamePageCubitState')
          ..add('players', players))
        .toString();
  }
}

class NewGamePageCubitStateBuilder
    implements Builder<NewGamePageCubitState, NewGamePageCubitStateBuilder> {
  _$NewGamePageCubitState? _$v;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  NewGamePageCubitStateBuilder();

  NewGamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _players = $v.players.toBuilder();
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
      _$result = _$v ?? new _$NewGamePageCubitState._(players: players.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'players';
        players.build();
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
