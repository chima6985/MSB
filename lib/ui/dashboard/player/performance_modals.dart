import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PerformanceModal extends StatelessWidget {
  const PerformanceModal({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final image = {
      'success': AppAssets.images.svgs.thumbs.svg(),
      'failure': AppAssets.images.svgs.cancel.svg(),
    };

    final modalMainText = {
      'success': nicelyDoneYr,
      'failure': oppsYr,
    };

    final modalSubText = {
      'success': successNailedItYr,
      'failure': failedZaggedYr,
    };

    final buttonLabel = {
      'success': context.appLocale.next,
      'failure': '${context.appLocale.next}!',
    };

    final buttonLabelColor = {
      'success': AppColors.white,
      'failure': AppColors.black15,
    };

    final buttonColor = {
      'success': AppColors.green58,
      'failure': AppColors.redFF,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 11,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              image[type] ?? const SizedBox(),
              const SizedBox(width: 5),
              Text(
                modalMainText[type] ?? '',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            modalSubText[type] ?? '',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 24.h),
          Button(
            label: buttonLabel[type] ?? '',
            labelColor: buttonLabelColor[type] ?? AppColors.white,
            color: buttonColor[type],
            borderColor: buttonColor[type],
            onPressed: () => context.pop(context),
            onLongPress: () =>
                context.pushReplacementNamed(ScoreBoardScreen.id),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
