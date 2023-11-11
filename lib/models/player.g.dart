// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Player extends Player {
  @override
  final String id;
  @override
  final String name;
  @override
  final String rank;

  factory _$Player([void Function(PlayerBuilder)? updates]) =>
      (new PlayerBuilder()..update(updates))._build();

  _$Player._({required this.id, required this.name, required this.rank})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Player', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Player', 'name');
    BuiltValueNullFieldError.checkNotNull(rank, r'Player', 'rank');
  }

  @override
  Player rebuild(void Function(PlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerBuilder toBuilder() => new PlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Player &&
        id == other.id &&
        name == other.name &&
        rank == other.rank;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Player')
          ..add('id', id)
          ..add('name', name)
          ..add('rank', rank))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rank;
  String? get rank => _$this._rank;
  set rank(String? rank) => _$this._rank = rank;

  PlayerBuilder();

  PlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _rank = $v.rank;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Player;
  }

  @override
  void update(void Function(PlayerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Player build() => _build();

  _$Player _build() {
    final _$result = _$v ??
        new _$Player._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Player', 'id'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Player', 'name'),
            rank:
                BuiltValueNullFieldError.checkNotNull(rank, r'Player', 'rank'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
