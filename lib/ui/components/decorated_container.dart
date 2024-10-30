import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/gen/assets.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

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
    return Stack(
      children: [
        Container(
          width: mqr.width,
          height: mqr.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AppAssets.images.jpegs.bgPattern.provider(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 197.w,
            height: 197.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.green62.withOpacity(0.3),
                  blurRadius: 120,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -250,
          child: Container(
            width: 400.w,
            height: 400.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue12,
                  blurRadius: 300,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: enablePadding
              ? const EdgeInsetsDirectional.symmetric(horizontal: 23)
              : EdgeInsets.zero,
          child: child,
        ),
      ],
    );
  }
}
