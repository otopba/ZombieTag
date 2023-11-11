import 'package:built_value/built_value.dart';

part 'player.g.dart';

abstract class Player implements Built<Player, PlayerBuilder> {
  factory Player([void Function(PlayerBuilder) updates]) = _$Player;

  Player._();

  String get id;

  String get name;

  String get rank;
}
