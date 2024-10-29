import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/gen/assets.gen.dart';

class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    super.key,
    required this.child,
    this.enablePadding = false,
  });

  final Widget child;
  final bool enablePadding;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Container(
      width: mqr.width,
      height: mqr.height,
      padding: enablePadding
          ? const EdgeInsetsDirectional.symmetric(horizontal: 23)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppAssets.images.jpegs.bgPattern.provider(),
        ),
      ),
      child: child,
    );
  }
}
