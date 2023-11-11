import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/models/serializers.dart';
import 'package:taggame/pages/roster/roster_page_cubit.dart';
import 'package:taggame/pages/roster/roster_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/utils/vibrates.dart';
import 'package:taggame/widgets/circular_layout.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'roster_page';

class RosterPage extends StatefulWidget {
  const RosterPage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  State<RosterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RosterPage>
    with TGPageStateMixin, TickerProviderStateMixin {
  final _radius = 120.w;
  final _avatarSize = 100.w;

  late final _cubit = RosterPageCubit(game: widget.game);
  late RosterPageCubitState _state;

  late final AnimationController _spinController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _spinController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_pulseController);
  }

  @override
  void dispose() {
    _cubit.close();
    _spinController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RosterPageCubit, RosterPageCubitState>(
      bloc: _cubit,
      builder: _builder,
      listenWhen: _listenWhen,
      listener: _listener,
    );
  }

  bool _listenWhen(
    RosterPageCubitState previous,
    RosterPageCubitState current,
  ) {
    return current.spinning != previous.spinning;
  }

  void _listener(BuildContext context, RosterPageCubitState state) {
    if (state.spinning) {
      _spinController.repeat();
      _pulseController.repeat(reverse: true);
    } else {
      _spinController.stop();
      _pulseController.stop();

      vibrateHeavy();

      Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          if (!mounted) return;
          ZombieSelectedRoute(
            serializedGame: jsonEncode(serialize(_state.game)),
          ).push(context);
        },
      );
    }
  }

  Widget _builder(
    BuildContext context,
    RosterPageCubitState state,
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
                  localizations.choosingZombie,
                  style: TGTextStyle.instance.styleH1.copyWith(
                    color: colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                SizedBox(
                  height: _radius * 2 + _avatarSize,
                  width: _radius * 2 + _avatarSize,
                  child: ScaleTransition(
                    scale: _pulseAnimation,
                    child: RotationTransition(
                      turns: _spinController,
                      child: CircularLayout(
                        radius: _radius,
                        children: _state.game.players
                            .map(
                              (it) => Hero(
                                tag: it.id,
                                child: RotationTransition(
                                  turns: _spinController,
                                  child: PlayerAvatar(
                                    player: it,
                                    size: _avatarSize,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
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
