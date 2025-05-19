import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/core/models/question_model.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.currentQuestionIndex,
    required this.totalNoOfQuestions,
    required this.isPracticeMode,
    required this.isSinglePlayerMode,
    required this.totalLives,
    required this.livesRemaining,
    required this.currentAltQuestionText,
    required this.currentQuestionText,
    this.onFlipPressed,
  });

  final int currentQuestionIndex;
  final int totalNoOfQuestions;
  final bool isPracticeMode;
  final bool isSinglePlayerMode;
  final int? totalLives;
  final int livesRemaining;
  final String currentAltQuestionText;
  final String currentQuestionText;
  final VoidCallback? onFlipPressed;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.greyDB,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 10,
                  percent: (currentQuestionIndex + 1) / totalNoOfQuestions,
                  progressColor: AppColors.blue12,
                  backgroundColor: AppColors.greyDB,
                  animation: true,
                  animateFromLastPercent: true,
                  barRadius: const Radius.circular(12),
                ),
              ),
              if ((isPracticeMode == true || isSinglePlayerMode == true) &&
                  totalLives != null) ...[
                SizedBox(width: 15.w),
                GameLivesWidget(
                  totalLives: totalLives ?? 0,
                  livesRemaining: livesRemaining,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentLocale == yo
                      ? currentAltQuestionText
                      : currentQuestionText,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentLocale == yo
                      ? currentQuestionText
                      : currentAltQuestionText,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 80.h),
                Row(
                  children: [
                    ActionButton(
                      label: 'Listen',
                      isEnabled: true,
                      icon: AppAssets.images.svgs.listen.svg(
                        width: 17.sp,
                        height: 17.sp,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 24),
                    ActionButton(
                      label: 'Speak',
                      isEnabled: true,
                      icon: Icon(
                        Iconsax.microphone_2,
                        size: 17.sp,
                        color: AppColors.black15,
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (context, stateSetter) {
                        return ActionButton(
                          label: 'Flip',
                          isEnabled: isPracticeMode,
                          icon: Icon(
                            Icons.swipe_right_rounded,
                            size: 17.sp,
                            color: AppColors.black15,
                          ),
                          onTap: onFlipPressed?.call,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlippedQuestionCard extends StatelessWidget {
  const FlippedQuestionCard({
    super.key,
    required this.currentQuestionIndex,
    required this.totalNoOfQuestions,
    required this.isPracticeMode,
    required this.answer,
  });

  final int currentQuestionIndex;
  final int totalNoOfQuestions;
  final bool isPracticeMode;
  final List<AnswerFormat>? answer;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final correctAnswer =
        (answer != null) ? answer?.first.answer.value?.titleCase() ?? '' : '';
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        color: AppColors.greyDB,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 10,
            percent: (currentQuestionIndex + 1) / totalNoOfQuestions,
            progressColor: AppColors.blue12,
            backgroundColor: AppColors.blueE7,
            animation: true,
            animateFromLastPercent: true,
            barRadius: const Radius.circular(12),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.appLocale.responseToTheQuestionIs,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentLocale == yo
                      ? context.enLocale.responseToTheQuestionIs
                      : context.yoLocale.responseToTheQuestionIs,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  correctAnswer,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  children: [
                    ActionButton(
                      label: 'Listen',
                      isEnabled: true,
                      icon: AppAssets.images.svgs.listen.svg(
                        width: 17.sp,
                        height: 17.sp,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 24),
                    ActionButton(
                      label: 'Speak',
                      isEnabled: false,
                      icon: Icon(
                        Iconsax.microphone_2,
                        size: 17.sp,
                        color: AppColors.black15,
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (context, stateSetter) {
                        return ActionButton(
                          label: 'Flip',
                          isEnabled: false,
                          icon: Icon(
                            Icons.swipe_right_rounded,
                            size: 17.sp,
                            color: AppColors.black15,
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
