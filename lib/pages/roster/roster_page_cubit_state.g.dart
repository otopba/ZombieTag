// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RosterPageCubitState extends RosterPageCubitState {
  @override
  final BuiltList<Player> players;
  @override
  final bool spinning;

  factory _$RosterPageCubitState(
          [void Function(RosterPageCubitStateBuilder)? updates]) =>
      (new RosterPageCubitStateBuilder()..update(updates))._build();

  _$RosterPageCubitState._({required this.players, required this.spinning})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        players, r'RosterPageCubitState', 'players');
    BuiltValueNullFieldError.checkNotNull(
        spinning, r'RosterPageCubitState', 'spinning');
  }

  @override
  RosterPageCubitState rebuild(
          void Function(RosterPageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RosterPageCubitStateBuilder toBuilder() =>
      new RosterPageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RosterPageCubitState &&
        players == other.players &&
        spinning == other.spinning;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, players.hashCode);
    _$hash = $jc(_$hash, spinning.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RosterPageCubitState')
          ..add('players', players)
          ..add('spinning', spinning))
        .toString();
  }
}

class RosterPageCubitStateBuilder
    implements Builder<RosterPageCubitState, RosterPageCubitStateBuilder> {
  _$RosterPageCubitState? _$v;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  bool? _spinning;
  bool? get spinning => _$this._spinning;
  set spinning(bool? spinning) => _$this._spinning = spinning;

  RosterPageCubitStateBuilder();

  RosterPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _players = $v.players.toBuilder();
      _spinning = $v.spinning;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RosterPageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RosterPageCubitState;
  }

  @override
  void update(void Function(RosterPageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RosterPageCubitState build() => _build();

  _$RosterPageCubitState _build() {
    _$RosterPageCubitState _$result;
    try {
      _$result = _$v ??
          new _$RosterPageCubitState._(
              players: players.build(),
              spinning: BuiltValueNullFieldError.checkNotNull(
                  spinning, r'RosterPageCubitState', 'spinning'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'players';
        players.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RosterPageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
