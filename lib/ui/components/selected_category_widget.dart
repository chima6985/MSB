import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? AppColors.blueE7 : null,
              border: Border.all(
                width: isSelected ? 1.5 : 0.4,
                color: isSelected ? AppColors.blue12 : AppColors.blackB6,
              ),
            ),
            child: Text(
              title,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class SelectFilledCategoryWidget extends StatelessWidget {
  const SelectFilledCategoryWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? AppColors.blueE7 : AppColors.blueE7,
              border: Border.all(
                width: isSelected ? 1.5 : 0,
                color: isSelected ? AppColors.blue12 : AppColors.transparent,
              ),
            ),
            child: Text(
              title,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class SelectCategoryWidget2 extends StatelessWidget {
  const SelectCategoryWidget2({
    super.key,
    required this.title,
    required this.isSelected,
    this.isShowBgColor = true,
    required this.onTap,
    this.bgColor,
    this.brColor,
    this.voteIndicator,
  });

  final String title;
  final bool isSelected;
  final bool isShowBgColor;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? brColor;
  final String? voteIndicator;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: mqr.width * 0.8,
              child: InkWell(
                onTap: onTap,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isShowBgColor
                        ? (isSelected ? bgColor ?? AppColors.blueE7 : null)
                        : null,
                    border: Border.all(
                      width: isSelected ? 1.5 : 0.4,
                      color: isSelected
                          ? brColor ?? AppColors.blue12
                          : AppColors.blackB6,
                    ),
                  ),
                  child: Text(
                    title,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w500 : FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            if (voteIndicator != null)
              Transform.translate(
                offset: const Offset(6, -10),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.blue12,
                  child: Text(
                    voteIndicator ?? '',
                    style: context.textTheme.bodySmall!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
