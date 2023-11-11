import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/kit/wd_animations.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'player_card';

class PlayerCard extends StatefulWidget {
  const PlayerCard({
    super.key,
    required this.player,
    required this.you,
    required this.ready,
  });

  final Player player;
  final bool you;
  final bool ready;

  @override
  PlayerCardState createState() => PlayerCardState();
}

class PlayerCardState extends State<PlayerCard> with TGPageStateMixin {
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
      color: colors.listItemBackgroundColor,
      child: InkWell(
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
              Hero(
                tag: widget.player.id,
                child: PlayerAvatar(player: widget.player),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: widget.player.name,
                        style: TGTextStyle.instance.style24.copyWith(
                          color: colors.primaryTextColor,
                        ),
                        children: [
                          if (widget.you)
                            TextSpan(
                              text: '  ${localizations.itIsYou}',
                              style: TGTextStyle.instance.style17.copyWith(
                                color: colors.secondaryTextColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      widget.player.rank,
                      style: TGTextStyle.instance.style17Semibold.copyWith(
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              AnimatedOpacity(
                curve: widget.ready
                    ? TGAnimations.appearCurve
                    : TGAnimations.disappearCurve,
                duration: TGAnimations.duration,
                opacity: widget.ready ? 1 : 0,
                child: Icon(
                  Icons.check,
                  color: colors.accentColor,
                  size: 20.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
