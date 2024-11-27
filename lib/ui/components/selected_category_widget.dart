import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
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

class SelectCategoryWidget2 extends StatelessWidget {
  const SelectCategoryWidget2({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.bgColor,
    this.brColor,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? brColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? bgColor ?? AppColors.blueE7 : null,
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
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
