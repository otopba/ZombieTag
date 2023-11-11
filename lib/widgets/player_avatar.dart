import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/kit/persistent_avatars.dart';
import 'package:taggame/models/player.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({
    super.key,
    required this.player,
    this.size,
  });

  final Player player;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: PersistentAvatars.fromText(player.name).image(
        width: size ?? 50.w,
        height: size ?? 50.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
