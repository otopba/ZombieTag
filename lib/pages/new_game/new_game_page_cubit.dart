import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit_state.dart';

const _tag = 'new_game_page_cubit';

class NewGamePageCubit extends Cubit<NewGamePageCubitState> {
  NewGamePageCubit()
      : super(
          NewGamePageCubitState(
            (b) => b
              ..players = ListBuilder<Player>(
                [
                  Player(
                    (b) => b
                      ..id = '1'
                      ..name = 'Oliver'
                      ..rank = 'Newbie',
                  ),
                  Player(
                    (b) => b
                      ..id = '2'
                      ..name = 'Emily'
                      ..rank = 'Super runner',
                  ),
                  Player(
                    (b) => b
                      ..id = '3'
                      ..name = 'Jacob'
                      ..rank = 'Professional',
                  ),
                ],
              ),
          ),
        ) {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }
}
