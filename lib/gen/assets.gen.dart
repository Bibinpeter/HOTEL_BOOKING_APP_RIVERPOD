/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/animation.json
  String get animation => 'assets/animation/animation.json';

  /// List of all assets
  List<String> get values => [animation];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/gallery1.png
  AssetGenImage get gallery1 =>
      const AssetGenImage('assets/images/gallery1.png');

  /// File path: assets/images/gallery2.png
  AssetGenImage get gallery2 =>
      const AssetGenImage('assets/images/gallery2.png');

  /// File path: assets/images/gallery3.png
  AssetGenImage get gallery3 =>
      const AssetGenImage('assets/images/gallery3.png');

  /// File path: assets/images/hotel-image.png
  AssetGenImage get hotelImage =>
      const AssetGenImage('assets/images/hotel-image.png');

  /// File path: assets/images/photo.png
  AssetGenImage get photo => const AssetGenImage('assets/images/photo.png');

  /// File path: assets/images/pngeggmapwalk.png
  AssetGenImage get pngeggmapwalk =>
      const AssetGenImage('assets/images/pngeggmapwalk.png');

  /// File path: assets/images/pngeggworldtrip.png
  AssetGenImage get pngeggworldtrip =>
      const AssetGenImage('assets/images/pngeggworldtrip.png');

  /// File path: assets/images/pngwingall.png
  AssetGenImage get pngwingall =>
      const AssetGenImage('assets/images/pngwingall.png');

  /// File path: assets/images/rakabtw_-M3YuHIpgmSY-unsplash.jpg
  AssetGenImage get rakabtwM3YuHIpgmSYUnsplash =>
      const AssetGenImage('assets/images/rakabtw_-M3YuHIpgmSY-unsplash.jpg');

  /// File path: assets/images/sign-in.png
  AssetGenImage get signIn => const AssetGenImage('assets/images/sign-in.png');

  /// File path: assets/images/thumbnail1.png
  AssetGenImage get thumbnail1 =>
      const AssetGenImage('assets/images/thumbnail1.png');

  /// File path: assets/images/thumbnail2.png
  AssetGenImage get thumbnail2 =>
      const AssetGenImage('assets/images/thumbnail2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        gallery1,
        gallery2,
        gallery3,
        hotelImage,
        photo,
        pngeggmapwalk,
        pngeggworldtrip,
        pngwingall,
        rakabtwM3YuHIpgmSYUnsplash,
        signIn,
        thumbnail1,
        thumbnail2
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
