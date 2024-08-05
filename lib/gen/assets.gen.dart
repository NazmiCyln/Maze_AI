/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/ai.json
  String get ai => 'assets/animations/ai.json';

  /// File path: assets/animations/ai_anim.json
  String get aiAnim => 'assets/animations/ai_anim.json';

  /// File path: assets/animations/dark_loading.json
  String get darkLoading => 'assets/animations/dark_loading.json';

  /// File path: assets/animations/light_loading.json
  String get lightLoading => 'assets/animations/light_loading.json';

  /// File path: assets/animations/lottie_loading.json
  String get lottieLoading => 'assets/animations/lottie_loading.json';

  /// File path: assets/animations/question2.json
  String get question2 => 'assets/animations/question2.json';

  /// List of all assets
  List<String> get values =>
      [ai, aiAnim, darkLoading, lightLoading, lottieLoading, question2];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Alert.svg
  SvgGenImage get alert => const SvgGenImage('assets/icons/Alert.svg');

  /// File path: assets/icons/Camera_Icon.svg
  SvgGenImage get cameraIcon =>
      const SvgGenImage('assets/icons/Camera_Icon.svg');

  /// File path: assets/icons/Failure.svg
  SvgGenImage get failure => const SvgGenImage('assets/icons/Failure.svg');

  /// File path: assets/icons/Gallery_Icon.svg
  SvgGenImage get galleryIcon =>
      const SvgGenImage('assets/icons/Gallery_Icon.svg');

  /// File path: assets/icons/Success.svg
  SvgGenImage get success => const SvgGenImage('assets/icons/Success.svg');

  /// File path: assets/icons/arrowHeadLeft.svg
  SvgGenImage get arrowHeadLeft =>
      const SvgGenImage('assets/icons/arrowHeadLeft.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [alert, cameraIcon, failure, galleryIcon, success, arrowHeadLeft];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/IconBg.png
  AssetGenImage get iconBg => const AssetGenImage('assets/images/IconBg.png');

  /// File path: assets/images/applogo.png
  AssetGenImage get applogo => const AssetGenImage('assets/images/applogo.png');

  /// File path: assets/images/applogo2.png
  AssetGenImage get applogo2 =>
      const AssetGenImage('assets/images/applogo2.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconBg, applogo, applogo2];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/en-US.json
  String get enUS => 'assets/lang/en-US.json';

  /// File path: assets/lang/tr-TR.json
  String get trTR => 'assets/lang/tr-TR.json';

  /// List of all assets
  List<String> get values => [enUS, trTR];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
