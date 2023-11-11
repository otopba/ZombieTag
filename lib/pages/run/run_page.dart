import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/gen/assets.gen.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/pages/run/run_page_cubit.dart';
import 'package:taggame/pages/run/run_page_cubit_state.dart';
import 'package:taggame/tg_page_mixin.dart';

const _tag = 'run_page';

class RunPage extends StatefulWidget {
  const RunPage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  State<RunPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RunPage> with TGPageStateMixin {
  late final _cubit = RunPageCubit(game: widget.game);
  late RunPageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunPageCubit, RunPageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    RunPageCubitState state,
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
                Opacity(
                  opacity: _state.showRun ? 1 : 0,
                  child: Text(
                    _state.currentPlayerZombie
                        ? localizations.wait.toUpperCase()
                        : localizations.run.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TGTextStyle.instance.gigant.copyWith(
                      color: _state.currentPlayerZombie
                          ? colors.accentColor
                          : colors.accentColor,
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Opacity(
                      opacity: _state.showRun ? 0 : 1,
                      child: Assets.run.lottie(repeat: false),
                    ),
                    Opacity(
                      opacity: _state.showRun ? 1 : 0,
                      child: Text(
                        _state.count.toString(),
                        style: TGTextStyle.instance.gigant.copyWith(
                          color: TGColors.redColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
