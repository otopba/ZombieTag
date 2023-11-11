// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Game> _$gameSerializer = new _$GameSerializer();

class _$GameSerializer implements StructuredSerializer<Game> {
  @override
  final Iterable<Type> types = const [Game, _$Game];
  @override
  final String wireName = 'Game';

  @override
  Iterable<Object?> serialize(Serializers serializers, Game object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'players',
      serializers.serialize(object.players,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Player)])),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(GameStatus)),
      'readyPlayers',
      serializers.serialize(object.readyPlayers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'zombies',
      serializers.serialize(object.zombies,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
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
  Game deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameBuilder();

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
        case 'players':
          result.players.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Player)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(GameStatus))! as GameStatus;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'readyPlayers':
          result.readyPlayers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'zombies':
          result.zombies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Game extends Game {
  @override
  final String id;
  @override
  final String uuid;
  @override
  final BuiltList<Player> players;
  @override
  final GameStatus status;
  @override
  final DateTime? createdAt;
  @override
  final BuiltList<String> readyPlayers;
  @override
  final BuiltList<String> zombies;

  factory _$Game([void Function(GameBuilder)? updates]) =>
      (new GameBuilder()..update(updates))._build();

  _$Game._(
      {required this.id,
      required this.uuid,
      required this.players,
      required this.status,
      this.createdAt,
      required this.readyPlayers,
      required this.zombies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Game', 'id');
    BuiltValueNullFieldError.checkNotNull(uuid, r'Game', 'uuid');
    BuiltValueNullFieldError.checkNotNull(players, r'Game', 'players');
    BuiltValueNullFieldError.checkNotNull(status, r'Game', 'status');
    BuiltValueNullFieldError.checkNotNull(
        readyPlayers, r'Game', 'readyPlayers');
    BuiltValueNullFieldError.checkNotNull(zombies, r'Game', 'zombies');
  }

  @override
  Game rebuild(void Function(GameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameBuilder toBuilder() => new GameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Game &&
        id == other.id &&
        uuid == other.uuid &&
        players == other.players &&
        status == other.status &&
        createdAt == other.createdAt &&
        readyPlayers == other.readyPlayers &&
        zombies == other.zombies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, uuid.hashCode);
    _$hash = $jc(_$hash, players.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, readyPlayers.hashCode);
    _$hash = $jc(_$hash, zombies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Game')
          ..add('id', id)
          ..add('uuid', uuid)
          ..add('players', players)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('readyPlayers', readyPlayers)
          ..add('zombies', zombies))
        .toString();
  }
}

class GameBuilder implements Builder<Game, GameBuilder> {
  _$Game? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _uuid;
  String? get uuid => _$this._uuid;
  set uuid(String? uuid) => _$this._uuid = uuid;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  GameStatus? _status;
  GameStatus? get status => _$this._status;
  set status(GameStatus? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<String>? _readyPlayers;
  ListBuilder<String> get readyPlayers =>
      _$this._readyPlayers ??= new ListBuilder<String>();
  set readyPlayers(ListBuilder<String>? readyPlayers) =>
      _$this._readyPlayers = readyPlayers;

  ListBuilder<String>? _zombies;
  ListBuilder<String> get zombies =>
      _$this._zombies ??= new ListBuilder<String>();
  set zombies(ListBuilder<String>? zombies) => _$this._zombies = zombies;

  GameBuilder() {
    Game._setDefaults(this);
  }

  GameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _uuid = $v.uuid;
      _players = $v.players.toBuilder();
      _status = $v.status;
      _createdAt = $v.createdAt;
      _readyPlayers = $v.readyPlayers.toBuilder();
      _zombies = $v.zombies.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Game other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Game;
  }

  @override
  void update(void Function(GameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Game build() => _build();

  _$Game _build() {
    _$Game _$result;
    try {
      _$result = _$v ??
          new _$Game._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Game', 'id'),
              uuid:
                  BuiltValueNullFieldError.checkNotNull(uuid, r'Game', 'uuid'),
              players: players.build(),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'Game', 'status'),
              createdAt: createdAt,
              readyPlayers: readyPlayers.build(),
              zombies: zombies.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'players';
        players.build();

        _$failedField = 'readyPlayers';
        readyPlayers.build();
        _$failedField = 'zombies';
        zombies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Game', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
