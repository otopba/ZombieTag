import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/firestore_mapper.dart';
import 'package:taggame/models/player.dart';

const _tag = 'player_repository';

class PlayerRepository {
  PlayerRepository() {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  Future<Player?> getPlayerById(String id) {
    return FirebaseFirestore.instance
        .doc('players/$id')
        .withConverter<Player?>(
          fromFirestore: mapFirestoreToModel,
          toFirestore: mapToFirestoreModel,
        )
        .get()
        .then((it) => it.data());
  }

  Future<void> savePlayer(Player player) {
    return FirebaseFirestore.instance
        .doc('players/${player.id}')
        .withConverter<Player?>(
          fromFirestore: mapFirestoreToModel,
          toFirestore: mapToFirestoreModel,
        )
        .set(player);
  }
}
