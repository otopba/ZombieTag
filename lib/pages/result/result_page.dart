import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:taggame/kit/text/tg_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/pages/result/result_page_cubit.dart';
import 'package:taggame/pages/result/result_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/bottom_wide_button.dart';
import 'package:taggame/widgets/player_head.dart';
import 'package:taggame/widgets/player_result_card.dart';

const _tag = 'result_page';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  State<ResultPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ResultPage> with TGPageStateMixin {
  late final _cubit = ResultPageCubit(game: widget.game);
  late ResultPageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultPageCubit, ResultPageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    ResultPageCubitState state,
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
                SizedBox(height: 10.h),
                const PlayerHead(),
                SizedBox(height: 100.h),
                Text(
                  _state.zombieWins
                      ? localizations.zombieWins
                      : localizations.humansWins,
                  style: TGTextStyle.instance.styleH1.copyWith(
                    color: colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                Text(
                  localizations.gameResult,
                  style: TGTextStyle.instance.style17.copyWith(
                    color: colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: _itemBuilder,
                    separatorBuilder: _separatorBuilder,
                    itemCount: _state.game.players.length,
                  ),
                ),
                BottomWideButton(
                  centralText: localizations.newGame.toUpperCase(),
                  centralTextColor: colors.backgroundColor,
                  shimmer: true,
                  onPressed: _onNewGamePressed,
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

    return PlayerResultCard(
      player: player,
      you: _state.currentPlayer?.id == player.id,
      steps: _state.game.steps[player.id],
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(height: 8.h);
  }

  void _onNewGamePressed() {
    Log.d(_tag, '_onNewGamePressed');

    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
    const BeforeGameRoute().pushReplacement(context);
  }
}
