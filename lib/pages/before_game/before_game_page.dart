import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/before_game/before_game_page_cubit.dart';
import 'package:taggame/pages/before_game/before_game_page_cubit_state.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/bottom_wide_button.dart';

const _tag = 'before_game_page';

class BeforeGamePage extends StatefulWidget {
  const BeforeGamePage({
    super.key,
  });

  @override
  State<BeforeGamePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BeforeGamePage> with TGPageStateMixin {
  final _cubit = BeforeGamePageCubit();
  late BeforeGamePageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeforeGamePageCubit, BeforeGamePageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    BeforeGamePageCubitState state,
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
                  localizations.appTitle,
                  style: TGTextStyle.instance.styleH1.copyWith(
                    color: colors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  localizations.appSubTitle,
                  style: TGTextStyle.instance.style24.copyWith(
                    color: colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                BottomWideButton(
                  centralText: localizations.newGame.toUpperCase(),
                  centralTextColor: colors.backgroundColor,
                  onPressed: _onNewGamePressed,
                ),
                SizedBox(height: 50.h),
                BottomWideButton(
                  centralText: localizations.joinGame.toUpperCase(),
                  centralTextColor: colors.backgroundColor,
                  onPressed: _onJoinGamePressed,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onNewGamePressed() {
    Log.d(_tag, '_onNewGamePressed');

    const NewGameRoute().push(context);
  }

  void _onJoinGamePressed() {
    Log.d(_tag, '_onJoinGamePressed');

    const JoinGameRoute().push(context);
  }
}
