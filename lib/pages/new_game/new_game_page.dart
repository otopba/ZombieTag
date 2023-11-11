import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit.dart';
import 'package:taggame/pages/new_game/new_game_page_cubit_state.dart';
import 'package:taggame/pages/roster/roster_page.dart';
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
                    itemCount: _state.players.length,
                  ),
                ),
                BottomWideButton(
                  centralText: localizations.start.toUpperCase(),
                  centralTextColor: colors.backgroundColor,
                  shimmer: true,
                  onPressed: _onStartGamePressed,
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
    return PlayerCard(player: _state.players[index]);
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(height: 8.h);
  }

  void _onStartGamePressed() {
    Log.d(_tag, '_onStartGamePressed');

    const RosterRoute().push(context);
  }
}
