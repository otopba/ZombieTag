// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GameStatus _$runr = const GameStatus._('run');
const GameStatus _$stop = const GameStatus._('stop');
const GameStatus _$finished = const GameStatus._('finished');
const GameStatus _$unknown = const GameStatus._('unknown');

GameStatus _$valueOf(String name) {
  switch (name) {
    case 'run':
      return _$runr;
    case 'stop':
      return _$stop;
    case 'finished':
      return _$finished;
    case 'unknown':
      return _$unknown;
    default:
      return _$unknown;
  }
}

final BuiltSet<GameStatus> _$values =
    new BuiltSet<GameStatus>(const <GameStatus>[
  _$runr,
  _$stop,
  _$finished,
  _$unknown,
]);

Serializer<GameStatus> _$gameStatusSerializer = new _$GameStatusSerializer();

class _$GameStatusSerializer implements PrimitiveSerializer<GameStatus> {
  @override
  final Iterable<Type> types = const <Type>[GameStatus];
  @override
  final String wireName = 'GameStatus';

  @override
  Object serialize(Serializers serializers, GameStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GameStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GameStatus.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
