// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zombie_seleted_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ZombieSelectedPageCubitState extends ZombieSelectedPageCubitState {
  @override
  final Player player;
  @override
  final bool ready;

  factory _$ZombieSelectedPageCubitState(
          [void Function(ZombieSelectedPageCubitStateBuilder)? updates]) =>
      (new ZombieSelectedPageCubitStateBuilder()..update(updates))._build();

  _$ZombieSelectedPageCubitState._({required this.player, required this.ready})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        player, r'ZombieSelectedPageCubitState', 'player');
    BuiltValueNullFieldError.checkNotNull(
        ready, r'ZombieSelectedPageCubitState', 'ready');
  }

  @override
  ZombieSelectedPageCubitState rebuild(
          void Function(ZombieSelectedPageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ZombieSelectedPageCubitStateBuilder toBuilder() =>
      new ZombieSelectedPageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ZombieSelectedPageCubitState &&
        player == other.player &&
        ready == other.ready;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, player.hashCode);
    _$hash = $jc(_$hash, ready.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ZombieSelectedPageCubitState')
          ..add('player', player)
          ..add('ready', ready))
        .toString();
  }
}

class ZombieSelectedPageCubitStateBuilder
    implements
        Builder<ZombieSelectedPageCubitState,
            ZombieSelectedPageCubitStateBuilder> {
  _$ZombieSelectedPageCubitState? _$v;

  PlayerBuilder? _player;
  PlayerBuilder get player => _$this._player ??= new PlayerBuilder();
  set player(PlayerBuilder? player) => _$this._player = player;

  bool? _ready;
  bool? get ready => _$this._ready;
  set ready(bool? ready) => _$this._ready = ready;

  ZombieSelectedPageCubitStateBuilder();

  ZombieSelectedPageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _player = $v.player.toBuilder();
      _ready = $v.ready;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ZombieSelectedPageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ZombieSelectedPageCubitState;
  }

  @override
  void update(void Function(ZombieSelectedPageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ZombieSelectedPageCubitState build() => _build();

  _$ZombieSelectedPageCubitState _build() {
    _$ZombieSelectedPageCubitState _$result;
    try {
      _$result = _$v ??
          new _$ZombieSelectedPageCubitState._(
              player: player.build(),
              ready: BuiltValueNullFieldError.checkNotNull(
                  ready, r'ZombieSelectedPageCubitState', 'ready'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ZombieSelectedPageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
