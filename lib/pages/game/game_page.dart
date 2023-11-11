import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/game_status.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/game/game_page_cubit.dart';
import 'package:taggame/pages/game/game_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'game_page';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  State<GamePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GamePage> with TGPageStateMixin {
  late final _cubit = GamePageCubit(game: widget.game);
  late GamePageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GamePageCubit, GamePageCubitState>(
      bloc: _cubit,
      builder: _builder,
      listenWhen: _listenWhen,
      listener: _listener,
    );
  }

  bool _listenWhen(
    GamePageCubitState previous,
    GamePageCubitState current,
  ) {
    return (previous.newZombie != current.newZombie &&
            current.newZombie != null) ||
        (previous.game.status != current.game.status &&
            current.game.status == GameStatus.finished);
  }

  void _listener(BuildContext context, GamePageCubitState state) {
    final newZombie = state.newZombie;

    if (state.game.status == GameStatus.finished) {
      ResultRoute(serializedGame: jsonEncode(serialize(_state.game)))
          .push(context);
      return;
    }

    if (newZombie == null) return;

    Flushbar(
      title: newZombie.name,
      message: localizations.anotherZombie,
      duration: const Duration(seconds: 10),
      icon: PlayerAvatar(player: newZombie),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      borderRadius: SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: 20.r,
          cornerSmoothing: 0.6,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    ).show(context);
  }

  Widget _builder(
    BuildContext context,
    GamePageCubitState state,
  ) {
    _state = state;

    return Scaffold(
      backgroundColor: _state.currentPlayerZombie
          ? colors.accentColor
          : colors.backgroundColor,
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
                  _state.currentPlayerZombie
                      ? localizations.youAreZombie
                      : localizations.youAreHuman,
                  style: TGTextStyle.instance.styleH2.copyWith(
                    color: _state.currentPlayerZombie
                        ? colors.backgroundColor.withOpacity(0.8)
                        : colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _state.currentPlayerZombie
                      ? localizations.catchThemAll
                      : localizations.runAway,
                  style: TGTextStyle.instance.style17.copyWith(
                    color: _state.currentPlayerZombie
                        ? colors.backgroundColor.withOpacity(0.8)
                        : colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                Text(
                  localizations.humansLeft(
                    _state.game.players.length - _state.game.zombies.length,
                  ),
                  style: TGTextStyle.instance.style28Medium.copyWith(
                    color: _state.currentPlayerZombie
                        ? colors.backgroundColor.withOpacity(0.8)
                        : colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _state.count.toString(),
                  style: TGTextStyle.instance.gigant.copyWith(
                    color: TGColors.redColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
