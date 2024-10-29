import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});
  static const String id = 'surveyScreen';

  @override
  Widget build(BuildContext context) {
    final selectedOptions = ValueNotifier<List<String>>([]);
    final currentIndex = ValueNotifier(0);

    final questionList = [
      increaseKnowledgeList,
      doWithYorubaLanguageList,
    ];

    final btmPad = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      body: DecoratedContainer(
        child: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, val, child) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
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
                        onPressed: () {},
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
                ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, val, child) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Column(
                          children: [
                            Text(
                              increaseKnowledgeYr,
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleLarge!.copyWith(
                                fontFamily: 'Margarine',
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                increaseKnowledgeEr,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  height: 1.4,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            ValueListenableBuilder(
                              valueListenable: selectedOptions,
                              builder: (context, val, child) {
                                return MultiGroupedSelector(
                                  options: questionList[currentIndex.value],
                                  selectedOptions: val,
                                  onChanged: (listOption) {
                                    final newSelection = List<String>.from(val);
                                    if (newSelection.contains(listOption)) {
                                      newSelection.remove(listOption);
                                    } else {
                                      newSelection.add(listOption);
                                    }
                                    selectedOptions.value = newSelection;
                                  },
                                );
                              },
                            ),
                            const Spacer(),
                            ValueListenableBuilder(
                              valueListenable: selectedOptions,
                              builder: (context, val, child) {
                                return Button(
                                  label: '',
                                  onPressed: () {
                                    if (selectedOptions.value.isNotEmpty &&
                                        currentIndex.value < 3) {
                                      currentIndex.value++;
                                    }
                                  },
                                  color: selectedOptions.value.isEmpty
                                      ? AppColors.blue12.withOpacity(0.3)
                                      : null,
                                  child: RichText(
                                    text: TextSpan(
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        color: AppColors.white,
                                      ),
                                      children: [
                                        const TextSpan(text: nextYr),
                                        TextSpan(
                                          text: ' ($nextEn)',
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: btmPad),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
