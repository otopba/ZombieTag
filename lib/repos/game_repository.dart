import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/firestore_mapper.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/models/serializers.dart';

const _tag = 'game_repository';

class GameRepository {
  GameRepository() {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  Future<Game> createGame(Game game) {
    return FirebaseFirestore.instance
        .collection('games')
        .withConverter<Game?>(
          fromFirestore: mapFirestoreToModel,
          toFirestore: mapToFirestoreModel,
        )
        .add(game)
        .then((it) => it.get())
        .then((it) => it.data()!);
  }

  Future<void> joinGame({
    required String gameId,
    required Player player,
  }) {
    Log.d(_tag, 'joinGame: gameId = $gameId, player = ${player.id}');

    return FirebaseFirestore.instance.doc('games/$gameId').update({
      'players': FieldValue.arrayUnion([serialize(player)])
    });
  }

  Stream<Game?> gameStream(String gameId) {
    return FirebaseFirestore.instance
        .doc('games/$gameId')
        .withConverter<Game?>(
          fromFirestore: mapFirestoreToModel,
          toFirestore: mapToFirestoreModel,
        )
        .snapshots()
        .map((it) => it.data());
  }

  Stream<BuiltList<Game>> stoppedGamesStream() {
    return FirebaseFirestore.instance
        .collection('games')
        .where('status', isEqualTo: 'stop')
        .withConverter<Game?>(
          fromFirestore: mapFirestoreToModel,
          toFirestore: mapToFirestoreModel,
        )
        .snapshots()
        .map(
          (it) => it.docs
              .map((doc) => doc.data())
              .where((data) => data != null)
              .cast<Game>()
              .toBuiltList(),
        );
  }

  Future<void> ready({
    required String gameId,
    required String playerId,
  }) {
    Log.d(_tag, 'ready: gameId = $gameId, player = $playerId');

    return FirebaseFirestore.instance.doc('games/$gameId').update({
      'readyPlayers': FieldValue.arrayUnion([playerId])
    });
  }

  Future<void> run({
    required String gameId,
    required String zombieId,
  }) {
    return FirebaseFirestore.instance.doc('games/$gameId').update({
      'status': 'run',
      'zombies': [zombieId],
    });
  }
}
