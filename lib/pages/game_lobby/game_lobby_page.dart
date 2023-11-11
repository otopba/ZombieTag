import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/tg_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game_status.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/game_lobby/game_lobby_page_cubit.dart';
import 'package:taggame/pages/game_lobby/game_lobby_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/bottom_wide_button.dart';
import 'package:taggame/widgets/player_card.dart';
import 'package:taggame/widgets/player_head.dart';

const _tag = 'game_lobby_page';

class GameLobbyPage extends StatefulWidget {
  const GameLobbyPage({
    super.key,
    required this.gameId,
  });

  final String gameId;

  @override
  State<GameLobbyPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GameLobbyPage> with TGPageStateMixin {
  late final _cubit = GameLobbyPageCubit(gameId: widget.gameId);
  late GameLobbyPageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameLobbyPageCubit, GameLobbyPageCubitState>(
      bloc: _cubit,
      builder: _builder,
      listenWhen: _listenWhen,
      listener: _listener,
    );
  }

  bool _listenWhen(
    GameLobbyPageCubitState previous,
    GameLobbyPageCubitState current,
  ) {
    return previous.game?.status != current.game?.status;
  }

  void _listener(BuildContext context, GameLobbyPageCubitState state) {
    final game = state.game;

    if (game == null || game.status != GameStatus.run) return;

    RosterRoute(serializedGame: jsonEncode(serialize(game))).push(context);
  }

  Widget _builder(
    BuildContext context,
    GameLobbyPageCubitState state,
  ) {
    _state = state;

    final game = _state.game;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.h),
                const PlayerHead(),
                SizedBox(height: 100.h),
                Text(
                  localizations.appTitle,
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
                if (game == null)
                  const SizedBox.shrink()
                else ...[
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: _itemBuilder,
                      separatorBuilder: _separatorBuilder,
                      itemCount: game.players.length,
                    ),
                  ),
                  BottomWideButton(
                    centralText: localizations.ready.toUpperCase(),
                    centralTextColor: colors.backgroundColor,
                    color: _cubit.canPressReady()
                        ? colors.accentColor
                        : colors.accentColor.withOpacity(0.2),
                    shimmer: _cubit.canPressReady(),
                    onPressed: _cubit.canPressReady() ? _onReadyPressed : null,
                    enabled: _cubit.canPressReady(),
                  ),
                ],
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final player = _state.game!.players[index];

    return PlayerCard(
      player: player,
      you: _state.currentPlayer?.id == player.id,
      ready: _state.game!.readyPlayers.contains(player.id),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(height: 8.h);
  }

  void _onReadyPressed() {
    Log.d(_tag, '_onStartGamePressed');

    _cubit.ready();
  }
}
