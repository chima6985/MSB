import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlayQuestionScreen extends HookWidget {
  const PlayQuestionScreen({
    super.key,
  });
  static const String id = 'playQuestionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.topPadding),
            Center(
              child: Text(
                'Easy',
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                  height: 1.8,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      learnWhileYouPlayYr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.goldFC.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.goldCE,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppAssets.images.jpegs.coin2.image(
                        width: 24.w,
                        height: 24.w,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '0',
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.goldCE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question 321',
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ibeere Ọ̀kolelò̀ọ́dúnrún lékan',
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  FittedBox(
                    child: CircularPercentIndicator(
                      radius: 27,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 8.5,
                      backgroundWidth: 1.2,
                      percent: 0.4,
                      center: Text(
                        '26',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: AppColors.greyB6,
                      progressColor: AppColors.goldFC,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 22),
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
                  LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 10,
                    percent: 0.2,
                    progressColor: AppColors.blue12,
                    backgroundColor: AppColors.greyDB,
                    animation: true,
                    barRadius: const Radius.circular(12),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ki ni itumò òrò náà?',
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'What does the term mean?',
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              const TextSpan(text: 'Awon wo ni Yorubá n pè ní'),
                              TextSpan(
                                text: ' Oníyangí ',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(text: '?'),
                            ],
                          ),
                        ),
                        SizedBox(height: 65.h),
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
                            ActionButton(
                              label: 'Flip',
                              isEnabled: false,
                              icon: Icon(
                                Icons.swipe_right_rounded,
                                size: 17.sp,
                                color: AppColors.black15,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 10.5,
              ),
              decoration: BoxDecoration(
                color: AppColors.blueE7,
                border: Border.all(
                  color: AppColors.greyB6,
                  width: 0.6,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'N',
                style: context.textTheme.bodyLarge!.copyWith(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Move the tiles to form the word',
                textAlign: TextAlign.start,
                style: context.textTheme.bodySmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Button(
              label: 'Next',
              onPressed: () {},
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool isEnabled;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) {
          onTap.call();
        }
      },
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.5,
                  color: AppColors.black15,
                ),
              ),
              child: icon,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              textAlign: TextAlign.start,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
