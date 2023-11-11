import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taggame/kit/persistent_names.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/repos/player_repository.dart';

const _tag = 'current_player_service';

class CurrentPlayerService {
  CurrentPlayerService({
    required PlayerRepository playerRepository,
  }) : _playerRepository = playerRepository {
    _init();
  }

  final _playerSubject = BehaviorSubject<Player>();
  final PlayerRepository _playerRepository;

  Stream<Player> get currentPlayerStream => _playerSubject;

  Future<void> _init() async {
    Log.d(_tag, '_init');

    User? firebaseAuthUser = FirebaseAuth.instance.currentUser;

    if (firebaseAuthUser == null) {
      Log.d(_tag, 'No logged user');
      firebaseAuthUser = await signInAnonymously();
    }

    final player = await _getPlayer(firebaseAuthUser.uid);

    Log.d(_tag, '_init: player = $player');

    _playerSubject.add(player);
  }

  Future<void> dispose() async {
    await _playerSubject.close();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<User> signInAnonymously() async {
    Log.d(_tag, 'signInAnonymously');

    final credentials = await FirebaseAuth.instance.signInAnonymously();

    final firebaseAuthUser = credentials.user;

    Log.d(_tag, 'signInAnonymously: firebaseAuthUser = $firebaseAuthUser');

    return firebaseAuthUser!;
  }

  Future<Player> _getPlayer(String id) async {
    Player? player = await _playerRepository.getPlayerById(id);

    Log.d(_tag, '_getPlayer: id = $id, player = $player');

    if (player != null) return player;

    player = Player(
      (b) => b
        ..id = id
        ..name = PersistentNames.fromText(id)
        ..rank = 'Newbie'
        ..createdAt = DateTime.now().toUtc(),
    );

    Log.d(_tag, '_getPlayer: create new player');

    await _playerRepository.savePlayer(player);

    return player;
  }
}
