import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'game_status.g.dart';

class GameStatus extends EnumClass {
  const GameStatus._(super.name);

  static Serializer<GameStatus> get serializer => _$gameStatusSerializer;

  static const GameStatus run = _$runr;
  static const GameStatus stop = _$stop;
  static const GameStatus finished = _$finished;
  @BuiltValueEnumConst(fallback: true)
  static const GameStatus unknown = _$unknown;

  static BuiltSet<GameStatus> get values => _$values;

  static GameStatus valueOf(String name) => _$valueOf(name);
}
