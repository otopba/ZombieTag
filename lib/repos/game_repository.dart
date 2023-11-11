import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/firestore_mapper.dart';
import 'package:taggame/models/game.dart';

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
}
