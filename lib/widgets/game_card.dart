import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/models/game.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'game_card';

class GameCard extends StatefulWidget {
  const GameCard({
    super.key,
    required this.game,
    required this.selected,
    required this.onPressed,
    required this.your,
  });

  final Game game;
  final bool selected;
  final VoidCallback onPressed;
  final bool your;

  @override
  GameCardState createState() => GameCardState();
}

class GameCardState extends State<GameCard> with TGPageStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 20.r,
            cornerSmoothing: 0.6,
          ),
        ),
      ),
      color:
          widget.selected ? colors.accentColor : colors.listItemBackgroundColor,
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 20.r,
            cornerSmoothing: 0.6,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 28.w,
            right: 28.w,
            top: 18.h,
            bottom: 18.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              PlayerAvatar(player: widget.game.players.first),
              SizedBox(width: 20.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text:
                          localizations.hisGame(widget.game.players.first.name),
                      style: TGTextStyle.instance.style24.copyWith(
                        color: widget.selected
                            ? TGColors.blackColor
                            : colors.primaryTextColor,
                      ),
                      children: [
                        if (widget.your)
                          TextSpan(
                            text: '  ${localizations.itIsYour}',
                            style: TGTextStyle.instance.style17.copyWith(
                              color: widget.selected
                                  ? TGColors.blackColor.withOpacity(0.8)
                                  : colors.secondaryTextColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    localizations.playersCount(widget.game.players.length),
                    style: TGTextStyle.instance.style17Semibold.copyWith(
                      color: widget.selected
                          ? TGColors.blackColor.withOpacity(0.8)
                          : colors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
