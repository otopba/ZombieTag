import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/di.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/models/player.dart';
import 'package:taggame/services/current_player_service.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/widgets/player_avatar.dart';

class PlayerHead extends StatefulWidget {
  const PlayerHead({super.key});

  @override
  State<PlayerHead> createState() => _PlayerHeadState();
}

class _PlayerHeadState extends State<PlayerHead> with TGPageStateMixin {
  final currentPlayerService = di.get<CurrentPlayerService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: currentPlayerService.currentPlayerStream,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<Player> snapshot) {
    final player = snapshot.data;

    if (player == null) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayerAvatar(player: player),
        SizedBox(width: 10.w),
        Text(
          player.name,
          style: TGTextStyle.instance.style24.copyWith(
            color: colors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
