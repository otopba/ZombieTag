import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/tg_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/bottom_wide_button.dart';
import 'package:taggame/widgets/player_card.dart';

const _tag = 'new_game_page';

class NewGamePage extends StatefulWidget {
  const NewGamePage({
    super.key,
  });

  @override
  State<NewGamePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewGamePage> with TGPageStateMixin {
  final _cubit = NewGamePageCubit();
  late NewGamePageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewGamePageCubit, NewGamePageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    NewGamePageCubitState state,
  ) {
    _state = state;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.h),
                Text(
                  localizations.newGame,
                  style: TGTextStyle.instance.styleH1.copyWith(
                    color: colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                Text(
                  localizations.waitingForOtherPlayers,
                  style: TGTextStyle.instance.style17.copyWith(
                    color: colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: _itemBuilder,
                    separatorBuilder: _separatorBuilder,
                    itemCount: _state.game.players.length,
                  ),
                ),
                BottomWideButton(
                  centralText: localizations.start.toUpperCase(),
                  centralTextColor: colors.backgroundColor,
                  color: _cubit.isEverybodyReady()
                      ? colors.accentColor
                      : colors.accentColor.withOpacity(0.2),
                  shimmer: _cubit.canPressReady(),
                  onPressed:
                      _cubit.canPressReady() ? _onStartGamePressed : null,
                  enabled: _cubit.canPressReady(),
                  loading: _state.loading,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final player = _state.game.players[index];

    return PlayerCard(
      player: player,
      you: player.id == _state.currentPlayer?.id,
      ready: _state.game.readyPlayers.contains(player.id),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(height: 8.h);
  }

  Future<void> _onStartGamePressed() async {
    Log.d(_tag, '_onStartGamePressed');

    await _cubit.startGame();

    if (!mounted) return;

    RosterRoute(serializedGame: jsonEncode(serialize(_state.game)))
        .push(context);
  }
}
