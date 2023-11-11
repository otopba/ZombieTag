import 'package:concentric_transition/page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/gen/assets.gen.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/home/home_page_cubit.dart';
import 'package:taggame/pages/home/home_page_cubit_state.dart';
import 'package:taggame/pages/new_game/new_game_page.dart';
import 'package:taggame/services/navigator/router_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/bottom_wide_button.dart';

const _tag = 'home_page';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TGPageStateMixin {
  final _cubit = HomePageCubit();
  late HomePageCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    HomePageCubitState state,
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
                const Spacer(),
                Assets.zombie.lottie(),
                const Spacer(),
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

  void _onNewGamePressed() {
    Log.d(_tag, '_onNewGamePressed');

    // Navigator.of(context).push(
    //   ConcentricPageRoute(
    //     builder: (ctx) {
    //       return NewGamePage();
    //     },
    //   ),
    // );

    const NewGameRoute().push(context);
  }
}
