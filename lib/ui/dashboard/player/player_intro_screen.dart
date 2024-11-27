import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PlayerIntroScreen extends HookWidget {
  const PlayerIntroScreen({
    super.key,
    this.isPractice = false,
    this.isTimed = true,
  });
  static const String id = 'playerIntroScreen';

  final bool isPractice;
  final bool isTimed;

  @override
  Widget build(BuildContext context) {
    final locale = useState('yr');
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        isAnimate: true,
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Text(
              isPractice ? welcomeToPracticeModeYr : introductionToPlayerYr,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge!.copyWith(
                fontFamily: FontFamily.margarine,
                height: 1.8,
              ),
            ),
            const Spacer(),
            if (isPractice)
              Text(
                locale.value == 'yr' ? practicePrepYr : practicePrepEn,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 12.5.sp,
                  height: 1.8,
                  letterSpacing: 0.3,
                ),
              )
            else
              Text(
                locale.value == 'yr'
                    ? getReadyToTestYourSkillsYr
                    : getReadyToTestYourSkillsEn,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 12.5.sp,
                  height: 1.8,
                  letterSpacing: 0.3,
                ),
              ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                if (locale.value == 'en') {
                  locale.value = 'yr';
                } else {
                  locale.value = 'en';
                }
              },
              child: Text(
                'See translation',
                style: context.textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  letterSpacing: 0.3,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 30),
            Button(
              label: '',
              onPressed: () => context.pushReplacementNamed(
                PlayQuestionScreen.id,
                extra: {
                  'isPractice': isPractice,
                  'isTimed': isTimed,
                },
              ),
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(
                      text: isPractice ? startPracticeYr : startPlayingYr,
                    ),
                    TextSpan(
                      text: isPractice
                          ? ' ($startPracticeEn)'
                          : ' ($startPlayingEn)',
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
              label: backYr,
              isOutlined: true,
              labelColor: AppColors.black15,
              onPressed: () => context.pop(context),
            ),
            SizedBox(height: context.btmPadding + 38.h),
          ],
        ),
      ),
    );
  }
}
