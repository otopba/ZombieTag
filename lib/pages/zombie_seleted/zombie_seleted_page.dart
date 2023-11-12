import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/tg_text_style.dart';
import 'package:taggame/kit/tg_animations.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/zombie_seleted/zombie_seleted_page_cubit.dart';
import 'package:taggame/pages/zombie_seleted/zombie_seleted_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'zombie_seleted';

class ZombieSelectedPage extends StatefulWidget {
  const ZombieSelectedPage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  State<ZombieSelectedPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ZombieSelectedPage>
    with TGPageStateMixin, TickerProviderStateMixin {
  late final _cubit = ZombieSelectedPageCubit(game: widget.game);
  late ZombieSelectedPageCubitState _state;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_pulseController);
  }

  @override
  void dispose() {
    _cubit.close();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ZombieSelectedPageCubit, ZombieSelectedPageCubitState>(
      bloc: _cubit,
      builder: _builder,
      listenWhen: _listenWhen,
      listener: _listener,
    );
  }

  bool _listenWhen(
    ZombieSelectedPageCubitState previous,
    ZombieSelectedPageCubitState current,
  ) {
    return current.ready != previous.ready;
  }

  void _listener(BuildContext context, ZombieSelectedPageCubitState state) {
    if (!state.ready) return;

    RunRoute(serializedGame: jsonEncode(serialize(state.game))).push(context);
  }

  Widget _builder(
    BuildContext context,
    ZombieSelectedPageCubitState state,
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
                  localizations.zombieIs,
                  style: TGTextStyle.instance.styleH1.copyWith(
                    color: colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                AnimatedOpacity(
                  opacity: _state.currentPlayer == null ? 0 : 1,
                  duration: TGAnimations.duration,
                  curve: _state.currentPlayer == null
                      ? TGAnimations.disappearCurve
                      : TGAnimations.appearCurve,
                  child: Text(
                    (_state.currentPlayer?.id == _cubit.getZombiePlayer().id)
                        ? localizations.you
                        : _cubit.getZombiePlayer().name.toUpperCase(),
                    style: TGTextStyle.instance.styleH1.copyWith(
                      color: colors.accentColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 100.h),
                Hero(
                  tag: _cubit.getZombiePlayer().id,
                  child: ScaleTransition(
                    scale: _pulseAnimation,
                    child: PlayerAvatar(
                      player: _cubit.getZombiePlayer(),
                      size: 200.w,
                    ),
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
