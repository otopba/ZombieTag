import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

const _tag = 'player_card';

class PlayerCard extends StatefulWidget {
  const PlayerCard({
    super.key,
    required this.player,
  });

  final Player player;

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
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.player.name,
                    style: TGTextStyle.instance.style24.copyWith(
                      color: colors.primaryTextColor,
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
            ],
          ),
        ),
      ),
    );
  }
}
