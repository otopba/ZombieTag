import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player.g.dart';

abstract class Player implements Built<Player, PlayerBuilder> {
  factory Player([void Function(PlayerBuilder) updates]) = _$Player;

  Player._();

  static Serializer<Player> get serializer => _$playerSerializer;

  String get id;

  String get name;

  String get rank;

  DateTime? get createdAt;
}
