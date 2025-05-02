import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';

class SvgNetworkWidget extends StatelessWidget {
  const SvgNetworkWidget({
    super.key,
    required this.url,
    required this.placeHolder,
    this.errorWidget,
    this.width,
    this.height,
  });

  final String url;
  final Widget placeHolder;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkSVGImage(
      url,
      placeholderBuilder: (context) => placeHolder,
      errorWidget: errorWidget ?? placeHolder,
      width: width,
      height: height,
    );
  }
}
