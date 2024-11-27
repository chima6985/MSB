import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class DailyReminderModal extends StatelessWidget {
  const DailyReminderModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 35),
        AppAssets.images.jpegs.remind.image(
          scale: 2.3.w,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              Text(
                letsGetYouAnAvatarYr,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                addSomeTouchOfPersonalityYr,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 32),
              Button(
                label: '',
                onPressed: () => context
                  ..pop(context)
                  ..pushNamed(
                    PlayerScreen.id,
                    extra: {'isPractice': true},
                  ),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                    children: [
                      const TextSpan(text: remindMeYr),
                      TextSpan(
                        text: ' ($remindMeEn)',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Button(
                label: '',
                isOutlined: true,
                labelColor: AppColors.black15,
                onPressed: () => context
                  ..pop(context)
                  ..pushNamed(
                    PlayerScreen.id,
                    extra: {'practice': true},
                  ),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: remindMeLaterYr),
                      TextSpan(
                        text: ' ($remindMeLaterEn)',
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.btmPadding),
      ],
    );
  }
}
