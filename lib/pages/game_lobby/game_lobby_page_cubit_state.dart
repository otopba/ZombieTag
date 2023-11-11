import 'package:built_value/built_value.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';

part 'game_lobby_page_cubit_state.g.dart';

abstract class GameLobbyPageCubitState
    implements Built<GameLobbyPageCubitState, GameLobbyPageCubitStateBuilder> {
  factory GameLobbyPageCubitState(
          [void Function(GameLobbyPageCubitStateBuilder) updates]) =
      _$GameLobbyPageCubitState;

  GameLobbyPageCubitState._();

  Game? get game;

  Player? get currentPlayer;
}
