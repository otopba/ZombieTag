/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsAvatarsGen {
  const $AssetsAvatarsGen();

  /// File path: assets/avatars/avatar_1.jpg
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/avatars/avatar_1.jpg');

  /// File path: assets/avatars/avatar_10.jpg
  AssetGenImage get avatar10 =>
      const AssetGenImage('assets/avatars/avatar_10.jpg');

  /// File path: assets/avatars/avatar_11.jpg
  AssetGenImage get avatar11 =>
      const AssetGenImage('assets/avatars/avatar_11.jpg');

  /// File path: assets/avatars/avatar_12.jpg
  AssetGenImage get avatar12 =>
      const AssetGenImage('assets/avatars/avatar_12.jpg');

  /// File path: assets/avatars/avatar_13.jpg
  AssetGenImage get avatar13 =>
      const AssetGenImage('assets/avatars/avatar_13.jpg');

  /// File path: assets/avatars/avatar_14.jpg
  AssetGenImage get avatar14 =>
      const AssetGenImage('assets/avatars/avatar_14.jpg');

  /// File path: assets/avatars/avatar_15.jpg
  AssetGenImage get avatar15 =>
      const AssetGenImage('assets/avatars/avatar_15.jpg');

  /// File path: assets/avatars/avatar_16.jpg
  AssetGenImage get avatar16 =>
      const AssetGenImage('assets/avatars/avatar_16.jpg');

  /// File path: assets/avatars/avatar_17.jpg
  AssetGenImage get avatar17 =>
      const AssetGenImage('assets/avatars/avatar_17.jpg');

  /// File path: assets/avatars/avatar_18.jpg
  AssetGenImage get avatar18 =>
      const AssetGenImage('assets/avatars/avatar_18.jpg');

  /// File path: assets/avatars/avatar_19.jpg
  AssetGenImage get avatar19 =>
      const AssetGenImage('assets/avatars/avatar_19.jpg');

  /// File path: assets/avatars/avatar_2.jpg
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/avatars/avatar_2.jpg');

  /// File path: assets/avatars/avatar_20.jpg
  AssetGenImage get avatar20 =>
      const AssetGenImage('assets/avatars/avatar_20.jpg');

  /// File path: assets/avatars/avatar_3.jpg
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/avatars/avatar_3.jpg');

  /// File path: assets/avatars/avatar_4.jpg
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/avatars/avatar_4.jpg');

  /// File path: assets/avatars/avatar_5.jpg
  AssetGenImage get avatar5 =>
      const AssetGenImage('assets/avatars/avatar_5.jpg');

  /// File path: assets/avatars/avatar_6.jpg
  AssetGenImage get avatar6 =>
      const AssetGenImage('assets/avatars/avatar_6.jpg');

  /// File path: assets/avatars/avatar_7.jpg
  AssetGenImage get avatar7 =>
      const AssetGenImage('assets/avatars/avatar_7.jpg');

  /// File path: assets/avatars/avatar_8.jpg
  AssetGenImage get avatar8 =>
      const AssetGenImage('assets/avatars/avatar_8.jpg');

  /// File path: assets/avatars/avatar_9.jpg
  AssetGenImage get avatar9 =>
      const AssetGenImage('assets/avatars/avatar_9.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar1,
        avatar10,
        avatar11,
        avatar12,
        avatar13,
        avatar14,
        avatar15,
        avatar16,
        avatar17,
        avatar18,
        avatar19,
        avatar2,
        avatar20,
        avatar3,
        avatar4,
        avatar5,
        avatar6,
        avatar7,
        avatar8,
        avatar9
      ];
}

class Assets {
  Assets._();

  static const $AssetsAvatarsGen avatars = $AssetsAvatarsGen();
  static const LottieGenImage run = LottieGenImage('assets/run.json');
  static const LottieGenImage zombie = LottieGenImage('assets/zombie.json');

  /// List of all assets
  List<LottieGenImage> get values => [run, zombie];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
