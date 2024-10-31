import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelColor = AppColors.white,
    this.child,
    this.color,
    this.width,
    this.verticalPadding = 10.5,
    this.isShowArrow = false,
    this.isBoldLabelText = false,
    this.isOutlined = true,
  });
  final String label;
  final void Function() onPressed;
  final Color labelColor;
  final Color? color;
  final Widget? child;
  final double verticalPadding;
  final double? width;
  final bool isShowArrow;
  final bool isBoldLabelText;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mqr = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: AppColors.transparent,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        backgroundColor:
            isOutlined ? color ?? AppColors.blue12 : AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: BorderSide(
          color: isOutlined ? AppColors.black15 : AppColors.blue12,
        ),
      ),
      onPressed: onPressed,
      child: IntrinsicWidth(
        child: SizedBox(
          width: width ?? mqr.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FittedBox(
                child: child ??
                    Text(
                      label,
                      textScaler: TextScaler.noScaling,
                      style: textTheme.bodyMedium!.copyWith(
                        color: isOutlined ? labelColor : AppColors.white,
                        fontWeight:
                            isBoldLabelText ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: () => context.pop(),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Icon(
              Iconsax.arrow_left_2,
              color: AppColors.black15,
            ),
          ),
        ),
      ),
    );
  }
}
