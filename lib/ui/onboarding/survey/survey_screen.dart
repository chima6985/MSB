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
    final surveyReasonAnswer = useState(<String>[]);
    final surveyUsageAnswer = useState(<String>[]);
    final surveyCommitmentAnswer = useState('');
    final surveyAgeAnswer = useState('');

    final surveyMainText = [
      context.appLocale.increaseKnowledge,
      context.appLocale.likeToDo,
      context.appLocale.timeToCommit,
      context.appLocale.howOld,
    ];

    final surveySubText = [
      currentLocale == yo
          ? context.enLocale.increaseKnowledge
          : context.yoLocale.increaseKnowledge,
      currentLocale == yo
          ? context.enLocale.likeToDo
          : context.yoLocale.likeToDo,
      currentLocale == yo
          ? context.enLocale.timeToCommit
          : context.yoLocale.timeToCommit,
      currentLocale == yo ? context.enLocale.howOld : context.yoLocale.howOld,
    ];

    final surveyReason = [
      '${context.appLocale.businessOrCareer} (${currentLocale == yo ? context.enLocale.businessOrCareer : context.yoLocale.businessOrCareer})',
      '${context.appLocale.travel} (${currentLocale == yo ? context.enLocale.travel : context.yoLocale.travel})',
      '${context.appLocale.friends} (${currentLocale == yo ? context.enLocale.friends : context.yoLocale.friends})',
      '${context.appLocale.schoolOrExam} (${currentLocale == yo ? context.enLocale.schoolOrExam : context.yoLocale.schoolOrExam})',
      '${context.appLocale.fun} (${currentLocale == yo ? context.enLocale.fun : context.yoLocale.fun})',
    ];

    final surveyUsage = [
      '${context.appLocale.sendText} (${currentLocale == yo ? context.enLocale.sendText : context.yoLocale.sendText})',
      '${context.appLocale.haveConversations} (${currentLocale == yo ? context.enLocale.haveConversations : context.yoLocale.haveConversations})',
      '${context.appLocale.culturalValues} (${currentLocale == yo ? context.enLocale.culturalValues : context.yoLocale.culturalValues})',
      '${context.appLocale.interactWithLocals} (${currentLocale == yo ? context.enLocale.interactWithLocals : context.yoLocale.interactWithLocals})',
      '${context.appLocale.artsMove} (${currentLocale == yo ? context.enLocale.artsMove : context.yoLocale.artsMove})',
    ];

    final surveyCommitment = [
      '${context.appLocale.tenMins} (${currentLocale == yo ? context.enLocale.tenMins : context.yoLocale.tenMins})',
      '${context.appLocale.fifteenMins} (${currentLocale == yo ? context.enLocale.fifteenMins : context.yoLocale.fifteenMins})',
      '${context.appLocale.twentyMins} (${currentLocale == yo ? context.enLocale.twentyMins : context.yoLocale.twentyMins})',
      '${context.appLocale.thirtyMins} (${currentLocale == yo ? context.enLocale.thirtyMins : context.yoLocale.thirtyMins})',
    ];

    final surveyAge = [
      '${context.appLocale.under18} (${currentLocale == yo ? context.enLocale.under18 : context.yoLocale.under18})',
      context.appLocale.eighteenToTwentyFour,
      context.appLocale.twentyFiveToThirtyFour,
      context.appLocale.thirtyFiveToFourtyFour,
      context.appLocale.fourtyFiveToFiftyFour,
      context.appLocale.fiftyFiveToSixtyFour,
      '${context.appLocale.sixtyFiveAndAbove} (${currentLocale == yo ? context.enLocale.sixtyFiveAndAbove : context.yoLocale.sixtyFiveAndAbove})',
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
                                  text: currentLocale == yo
                                      ? context.yoLocale.next
                                      : context.enLocale.next,
                                ),
                                TextSpan(
                                  text:
                                      ' (${currentLocale == yo ? context.enLocale.next : context.yoLocale.next})',
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
