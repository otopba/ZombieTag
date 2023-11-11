import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taggame/models/game_status.dart';
import 'package:taggame/models/player.dart';

part 'game.g.dart';

abstract class Game implements Built<Game, GameBuilder> {
  factory Game([void Function(GameBuilder) updates]) = _$Game;

  Game._();

  static Serializer<Game> get serializer => _$gameSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(GameBuilder b) => b
    ..readyPlayers = ListBuilder<String>()
    ..zombies = ListBuilder<String>();

  String get id;

  BuiltList<Player> get players;

  GameStatus get status;

  DateTime? get createdAt;

  BuiltList<String> get readyPlayers;

  BuiltList<String> get zombies;
}
