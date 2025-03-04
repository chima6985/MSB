// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({
    super.key,
  });

  static const String id = 'surveyScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSurveyCubit(),
      child: const _SurveyScreen(),
    );
  }
}

class _SurveyScreen extends HookWidget {
  const _SurveyScreen();

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final currentIndex = useState(0);
    final currentLocale = context.currentLocale;
    final yo = context.yoLocale;
    final en = context.enLocale;
    final surveyReasonAnswer = useState(<String>[]);
    final surveyUsageAnswer = useState(<String>[]);
    final surveyCommitmentAnswer = useState('');
    final surveyAgeAnswer = useState('');

    final surveyMainText = [
      currentLocale == 'yo' ? yo.increaseKnowledge : en.increaseKnowledge,
      currentLocale == 'yo' ? yo.likeToDo : en.likeToDo,
      currentLocale == 'yo' ? yo.timeToCommit : en.timeToCommit,
      currentLocale == 'yo' ? yo.howOld : en.howOld,
    ];

    final surveySubText = [
      currentLocale == 'yo' ? en.increaseKnowledge : yo.increaseKnowledge,
      currentLocale == 'yo' ? en.likeToDo : yo.likeToDo,
      currentLocale == 'yo' ? en.timeToCommit : yo.timeToCommit,
      currentLocale == 'yo' ? en.howOld : yo.howOld,
    ];

    final surveyReason = currentLocale == 'yo'
        ? [
            '${yo.businessOrCareer} (${en.businessOrCareer})',
            '${yo.travel} (${en.travel})',
            '${yo.friends} (${en.friends})',
            '${yo.schoolOrExam} (${en.schoolOrExam})',
            '${yo.fun} (${en.fun})',
          ]
        : [
            '${en.businessOrCareer} (${yo.businessOrCareer})',
            '${en.travel} (${yo.travel})',
            '${en.friends} (${yo.friends})',
            '${en.schoolOrExam} (${yo.schoolOrExam})',
            '${en.fun} (${yo.fun})',
          ];

    final surveyUsage = currentLocale == 'yo'
        ? [
            '${yo.sendText} (${en.sendText})',
            '${yo.haveConversations} (${en.haveConversations})',
            '${yo.culturalValues} (${en.culturalValues})',
            '${yo.interactWithLocals} (${en.interactWithLocals})',
            '${yo.artsMove} (${en.artsMove})',
          ]
        : [
            '${en.sendText} (${yo.sendText})',
            '${en.haveConversations} (${yo.haveConversations})',
            '${en.culturalValues} (${yo.culturalValues})',
            '${en.interactWithLocals} (${yo.interactWithLocals})',
            '${en.artsMove} (${yo.artsMove})',
          ];

    final surveyCommitment = currentLocale == 'yo'
        ? [
            '${yo.tenMins} (${en.tenMins})',
            '${yo.fifteenMins} (${en.fifteenMins})',
            '${yo.twentyMins} (${en.twentyMins})',
            '${yo.thirtyMins} (${en.thirtyMins})',
          ]
        : [
            '${en.tenMins} (${yo.tenMins})',
            '${en.fifteenMins} (${yo.fifteenMins})',
            '${en.twentyMins} (${yo.twentyMins})',
            '${en.thirtyMins} (${yo.thirtyMins})',
          ];

    final surveyAge = [
      currentLocale == 'yo'
          ? '${yo.under18} (${en.under18})'
          : '${en.under18} (${yo.under18})',
      context.appLocale.eighteenToTwentyFour,
      context.appLocale.twentyFiveToThirtyFour,
      context.appLocale.thirtyFiveToFourtyFour,
      context.appLocale.fourtyFiveToFiftyFour,
      context.appLocale.fiftyFiveToSixtyFour,
      currentLocale == 'yo'
          ? '${yo.sixtyFiveAndAbove} (${en.sixtyFiveAndAbove})'
          : '${en.sixtyFiveAndAbove} (${yo.sixtyFiveAndAbove})',
    ];

    return BlocListener<UserSurveyCubit, UserSurveyState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            context.goNamed(DiveInScreen.id);
          },
          error: (error) {
            isLoading.value = false;
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => isLoading.value = false,
        );
      },
      child: AbsorbPointer(
        absorbing: isLoading.value,
        child: Scaffold(
          body: DecoratedContainer(
            child: Column(
              children: [
                SizedBox(height: context.topPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentIndex.value > 0)
                      GestureDetector(
                        onTap: () {
                          if (currentIndex.value != 0) currentIndex.value--;
                        },
                        child: const AbsorbPointer(
                          child: CustomBackButton(),
                        ),
                      )
                    else
                      const SizedBox(),
                    Transform.translate(
                      offset: const Offset(-5, 0),
                      child: TextButton(
                        onPressed: () => context.goNamed(DiveInScreen.id),
                        child: Text(
                          'SKIP',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        Text(
                          surveyMainText[currentIndex.value],
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontFamily: FontFamily.margarine,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          surveySubText[currentIndex.value],
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            height: 1.4,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 32),
                        if (currentIndex.value == 0)
                          MultiGroupedSelector(
                            options: surveyReason,
                            selectedOptions: surveyReasonAnswer.value,
                            onChanged: (listOption) {
                              final newSelection =
                                  List<String>.from(surveyReasonAnswer.value);
                              if (newSelection.contains(listOption)) {
                                newSelection.remove(listOption);
                              } else {
                                newSelection.add(listOption);
                              }
                              surveyReasonAnswer.value = newSelection;
                            },
                          )
                        else if (currentIndex.value == 1)
                          MultiGroupedSelector(
                            options: surveyUsage,
                            selectedOptions: surveyUsageAnswer.value,
                            onChanged: (listOption) {
                              final newSelection =
                                  List<String>.from(surveyUsageAnswer.value);
                              if (newSelection.contains(listOption)) {
                                newSelection.remove(listOption);
                              } else {
                                newSelection.add(listOption);
                              }
                              surveyUsageAnswer.value = newSelection;
                            },
                          )
                        else if (currentIndex.value == 2)
                          MultiGroupedSelector(
                            options: surveyCommitment,
                            selectedOptions: [surveyCommitmentAnswer.value],
                            isMultipleSelection: false,
                            onChanged: (option) =>
                                surveyCommitmentAnswer.value = option,
                          )
                        else if (currentIndex.value == 3)
                          MultiGroupedSelector(
                            options: surveyAge,
                            selectedOptions: [surveyAgeAnswer.value],
                            isMultipleSelection: false,
                            onChanged: (option) =>
                                surveyAgeAnswer.value = option,
                          ),
                        const Spacer(),
                        Button(
                          label: '',
                          isLoading: isLoading.value,
                          onPressed: () {
                            if (currentIndex.value == 0) {
                              if (surveyReasonAnswer.value.isEmpty) {
                                ToastMessage.showWarning(
                                  context: context,
                                  text: context
                                      .appLocale.pleaseSelectAtleastOneOption,
                                );
                                return;
                              } else {
                                currentIndex.value++;
                                return;
                              }
                            }
                            if (currentIndex.value == 1) {
                              if (surveyUsageAnswer.value.isEmpty) {
                                ToastMessage.showWarning(
                                  context: context,
                                  text: context
                                      .appLocale.pleaseSelectAtleastOneOption,
                                );
                                return;
                              } else {
                                currentIndex.value++;
                                return;
                              }
                            }
                            if (currentIndex.value == 2) {
                              if (surveyCommitmentAnswer.value.isEmpty) {
                                ToastMessage.showWarning(
                                  context: context,
                                  text: context.appLocale.pleaseSelectAnOption,
                                );
                                return;
                              } else {
                                currentIndex.value++;
                                return;
                              }
                            }
                            if (currentIndex.value == 3) {
                              if (surveyAgeAnswer.value.isEmpty) {
                                ToastMessage.showWarning(
                                  context: context,
                                  text: context.appLocale.pleaseSelectAnOption,
                                );
                                return;
                              } else {
                                context
                                    .read<UserSurveyCubit>()
                                    .answerUserSurvey(
                                      email: AppStorage.getEmail() ?? '',
                                      surveyReason: surveyReasonAnswer.value,
                                      surveyUsage: surveyUsageAnswer.value,
                                      surveyCommitment:
                                          surveyCommitmentAnswer.value,
                                      surveyAge: surveyAgeAnswer.value,
                                    );
                              }
                            }
                          },
                          child: RichText(
                            text: TextSpan(
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.white,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      currentLocale == 'yo' ? yo.next : en.next,
                                ),
                                TextSpan(
                                  text:
                                      ' (${currentLocale == 'yo' ? en.next : yo.next})',
                                  style: context.textTheme.bodySmall!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: context.btmPadding),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
