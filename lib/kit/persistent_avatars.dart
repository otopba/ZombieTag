import 'package:taggame/gen/assets.gen.dart';

class PersistentAvatars {
  PersistentAvatars._();

  static final avatars = [
    Assets.avatars.avatar1,
    Assets.avatars.avatar2,
    Assets.avatars.avatar3,
    Assets.avatars.avatar4,
    Assets.avatars.avatar5,
    Assets.avatars.avatar6,
    Assets.avatars.avatar7,
    Assets.avatars.avatar8,
    Assets.avatars.avatar9,
    Assets.avatars.avatar10,
    Assets.avatars.avatar11,
  ];

  static AssetGenImage fromText(String text) {
    return avatars[text.hashCode % avatars.length];
  }
}
