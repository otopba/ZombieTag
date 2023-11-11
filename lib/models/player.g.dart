// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Player> _$playerSerializer = new _$PlayerSerializer();

class _$PlayerSerializer implements StructuredSerializer<Player> {
  @override
  final Iterable<Type> types = const [Player, _$Player];
  @override
  final String wireName = 'Player';

  @override
  Iterable<Object?> serialize(Serializers serializers, Player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'rank',
      serializers.serialize(object.rank, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Player deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rank':
          result.rank = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Player extends Player {
  @override
  final String id;
  @override
  final String uuid;
  @override
  final String name;
  @override
  final String rank;
  @override
  final DateTime? createdAt;

  factory _$Player([void Function(PlayerBuilder)? updates]) =>
      (new PlayerBuilder()..update(updates))._build();

  _$Player._(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.rank,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Player', 'id');
    BuiltValueNullFieldError.checkNotNull(uuid, r'Player', 'uuid');
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
        uuid == other.uuid &&
        name == other.name &&
        rank == other.rank &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, uuid.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Player')
          ..add('id', id)
          ..add('uuid', uuid)
          ..add('name', name)
          ..add('rank', rank)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _uuid;
  String? get uuid => _$this._uuid;
  set uuid(String? uuid) => _$this._uuid = uuid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rank;
  String? get rank => _$this._rank;
  set rank(String? rank) => _$this._rank = rank;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  PlayerBuilder();

  PlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _uuid = $v.uuid;
      _name = $v.name;
      _rank = $v.rank;
      _createdAt = $v.createdAt;
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
            uuid:
                BuiltValueNullFieldError.checkNotNull(uuid, r'Player', 'uuid'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Player', 'name'),
            rank:
                BuiltValueNullFieldError.checkNotNull(rank, r'Player', 'rank'),
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
