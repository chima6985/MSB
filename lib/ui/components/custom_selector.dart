import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class MultiGroupedSelector extends StatelessWidget {
  const MultiGroupedSelector({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.onChanged,
    this.isMultipleSelection = true,
  });

  final List<String> options;
  final List<String> selectedOptions;
  final ValueChanged<String> onChanged;
  final bool isMultipleSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.blueE7 : null,
            border: Border.all(
              color: AppColors.blue12,
            ),
          ),
          child: InkWell(
            onTap: () => onChanged(option),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
              child: Row(
                children: [
                  if (isMultipleSelection)
                    _RadioIndicator(isSelected: isSelected)
                  else
                    CheckBoxIndicator(isSelected: isSelected),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(0, -1),
                      child: Text(
                        option,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CheckBoxIndicator extends StatelessWidget {
  const CheckBoxIndicator({super.key, 
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.white : null,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blue12,
              width: 0.7,
            ),
          ),
        ),
        if (isSelected)
          const CircleAvatar(
            radius: 6,
            backgroundColor: AppColors.blue12,
          ),
      ],
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue12 : null,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.blue12,
              width: 0.7,
            ),
          ),
        ),
        if (isSelected)
          const Center(
            child: Icon(
              Icons.check_rounded,
              color: AppColors.white,
              size: 15,
            ),
          ),
      ],
    );
  }
}
