import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PlayerIntroScreen extends StatelessWidget {
  const PlayerIntroScreen({
    super.key,
    this.isPractice = false,
    this.isSinglePlayer = false,
    this.questionSection,
  });

  final bool isPractice, isSinglePlayer;
  final Section? questionSection;

  static const String id = 'playerIntroScreen';

  @override
  Widget build(BuildContext context) {
    return _PlayerIntroScreen(
      isPractice: isPractice,
      isSinglePlayer: isSinglePlayer,
      questionSection: questionSection,
    );
  }
}

class _PlayerIntroScreen extends HookWidget {
  const _PlayerIntroScreen({
    required this.isPractice,
    required this.isSinglePlayer,
    required this.questionSection,
  });

  final bool isPractice, isSinglePlayer;
  final Section? questionSection;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final selectedLocale = useState(currentLocale);
    final questions = context.watch<GetQuestionCubit>().state.whenOrNull(
              loaded: (questions) => questions,
            ) ??
        <Question>[];
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        isAnimate: true,
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Text(
              isPractice
                  ? welcomeToPracticeModeYr
                  : context.appLocale.welcomeToSinglePlayerMode,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge!.copyWith(
                fontFamily: FontFamily.margarine,
                height: 1.8,
              ),
            ),
            const Spacer(),
            if (isPractice)
              Text(
                selectedLocale.value == yo
                    ? context.yoLocale.practicePrep
                    : context.enLocale.practicePrep,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 12.5.sp,
                  height: 1.8,
                  letterSpacing: 0.3,
                ),
              )
            else
              Text(
                selectedLocale.value == yo
                    ? context.yoLocale.getReadyToTestYourSkills
                    : context.enLocale.getReadyToTestYourSkills,
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
                if (selectedLocale.value == yo) {
                  selectedLocale.value = en;
                } else {
                  selectedLocale.value = yo;
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
              onPressed: () {
                if (isPractice) {
                  context.pushReplacementNamed(
                    PlayQuestionScreen.id,
                    extra: {
                      'isPractice': isPractice,
                      'questionSection': questionSection,
                    },
                  );
                } else {
                  context.pushNamed(
                    PlayQuestionScreen.id,
                    extra: {
                      'isSinglePlayer': true,
                      'questionSection': questionSection,
                    },
                  );
                }
              },
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(
                      text: isPractice
                          ? context.appLocale.startPractice
                          : context.appLocale.startPlaying,
                    ),
                    TextSpan(
                      text: isPractice
                          ? ' (${currentLocale == yo ? context.enLocale.startPractice : context.yoLocale.startPractice})'
                          : ' (${currentLocale == yo ? context.enLocale.startPlaying : context.yoLocale.startPlaying})',
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
              label: context.appLocale.back,
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

//  currentLocale == yo
//                         ? context.enLocale.enterDetails
//                         : context.yoLocale.enterDetails,
