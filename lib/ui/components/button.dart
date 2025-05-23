import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.labelColor = AppColors.white,
    this.child,
    this.color,
    this.width,
    this.verticalPadding = 10.5,
    this.isShowArrow = false,
    this.isBoldLabelText = false,
    this.isOutlined = false,
    this.isLoading = false,
    this.borderColor,
  });
  final String label;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final Color? labelColor;
  final Color? color;
  final Widget? child;
  final double verticalPadding;
  final double? width;
  final bool isShowArrow;
  final bool isBoldLabelText;
  final bool isOutlined;
  final bool isLoading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: AppColors.transparent,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        backgroundColor:
            !isOutlined ? color ?? AppColors.blue12 : AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: isOutlined
            ? BorderSide(
                color: borderColor ?? AppColors.black15,
              )
            : null,
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: IntrinsicWidth(
        child: SizedBox(
          width: width ?? mqr.width,
          child: Center(
            child: isLoading
                ? const CustomSpinner()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FittedBox(
                      child: child ??
                          Text(
                            label,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: labelColor ?? AppColors.white,
                              fontWeight: isBoldLabelText
                                  ? FontWeight.w500
                                  : FontWeight.w400,
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
  const CustomBackButton({
    super.key,
    this.buttonColor = AppColors.black15,
    this.onTap,
  });

  final Color? buttonColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: onTap ?? () => context.pop(),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          splashColor: AppColors.black15.withValues(alpha: 0.1),
          highlightColor: AppColors.black15.withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Icon(
              Iconsax.arrow_left_2,
              color: buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
