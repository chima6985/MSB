import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.buttonName,
    required this.buttonIcon,
    required this.buttonIconBold,
    this.position = 0,
    this.currentPosition = 0,
    required this.onPressed,
    this.animationController,
  });

  final String buttonName;
  final IconData buttonIcon;
  final IconData buttonIconBold;
  final int position;
  final int currentPosition;
  final void Function() onPressed;
  final Animation? animationController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: position == currentPosition ? 26.sp : 26.sp,
            position == currentPosition ? buttonIconBold : buttonIcon,
          ),
          const SizedBox(height: 5),
          Text(
            buttonName,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: position == currentPosition
                  ? FontWeight.w500
                  : FontWeight.w300,
              color: AppColors.black15,
            ),
          ),
        ],
      ),
    );
  }
}
