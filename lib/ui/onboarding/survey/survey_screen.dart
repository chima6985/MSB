import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});
  static const String id = 'surveyScreen';

  @override
  Widget build(BuildContext context) {
    final selectedOptions = ValueNotifier<List<String>>([]);
    final currentIndex = ValueNotifier(0);
    return Scaffold(
      body: DecoratedContainer(
        child: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, val, child) {
            return Column(
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
                ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, val, child) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          children: [
                            Text(
                              surveyText[currentIndex.value]![0] as String,
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleLarge!.copyWith(
                                fontFamily: FontFamily.margarine,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              surveyText[currentIndex.value]![1] as String,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodySmall!.copyWith(
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 32),
                            ValueListenableBuilder(
                              valueListenable: selectedOptions,
                              builder: (context, val, child) {
                                return MultiGroupedSelector(
                                  options: surveyText[currentIndex.value]![2]
                                      as List<String>,
                                  selectedOptions: val,
                                  isMultipleSelection: currentIndex.value < 2,
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
                                    if (currentIndex.value == 3) {
                                      context.goNamed(DiveInScreen.id);
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
                            SizedBox(height: context.btmPadding),
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
