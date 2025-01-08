import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PlayerScreen extends HookWidget {
  const PlayerScreen({
    super.key,
    this.isPractice = false,
    this.isSinglePlayer = false,
    this.isMultiPlayer = false,
  });
  static const String id = 'playerScreen';

  final bool isPractice;
  final bool isSinglePlayer;
  final bool isMultiPlayer;

  @override
  Widget build(BuildContext context) {
    final selectedPracticeSection = useState('');
    final isTeamMode = useState<bool?>(null);
    final isTeamFormationAutomatic = useState<bool?>(null);
    final mqr = MediaQuery.of(context).size;
    final selectedDifficulty = useState<DifficultyLevel?>(null);
    final categoryScrollController = useScrollController();
    final difficultyLevelScrollController = useScrollController();
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          singlePlayerYr,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontFamily: FontFamily.margarine,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          modifyPlayModeYr,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontFamily: FontFamily.margarine,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 10),
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: selectCategoryYr),
                    TextSpan(
                      text: ' ($selectCategoryEn)',
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 29.w),
              scrollDirection: Axis.horizontal,
              controller: categoryScrollController,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isPractice
                    ? [
                        SelectCategoryWidget(
                          title: 'Timed',
                          isSelected: selectedPracticeSection.value == 'timed',
                          onTap: () => selectedPracticeSection.value = 'timed',
                        ),
                        SelectCategoryWidget(
                          title: 'Not timed',
                          isSelected:
                              selectedPracticeSection.value == 'not_timed',
                          onTap: () =>
                              selectedPracticeSection.value = 'not_timed',
                        ),
                      ]
                    : [
                        SelectCategoryWidget(
                          title: proverbYr,
                          isSelected:
                              selectedPracticeSection.value == 'proverb',
                          onTap: () {
                            selectedPracticeSection.value = 'proverb';
                            Functions.autoScroll(
                              controller: categoryScrollController,
                              position: 0,
                            );
                          },
                        ),
                        SelectCategoryWidget(
                          title: meaningYr,
                          isSelected:
                              selectedPracticeSection.value == 'meaning',
                          onTap: () {
                            selectedPracticeSection.value = 'meaning';
                            Functions.autoScroll(
                              controller: categoryScrollController,
                              position: mqr.width * 0.1,
                            );
                          },
                        ),
                        SelectCategoryWidget(
                          title: numbersYr,
                          isSelected: selectedPracticeSection.value == 'number',
                          onTap: () {
                            selectedPracticeSection.value = 'number';
                            Functions.autoScroll(
                              controller: categoryScrollController,
                              position: mqr.width * 0.1,
                            );
                          },
                        ),
                        SelectCategoryWidget(
                          title: questionAndAnswerYr,
                          isSelected: selectedPracticeSection.value == 'qAndA',
                          onTap: () {
                            selectedPracticeSection.value = 'qAndA';
                            Functions.autoScroll(
                              controller: categoryScrollController,
                              position: mqr.width * 0.15,
                            );
                          },
                        ),
                      ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 10),
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: selectDifficultyYr),
                    TextSpan(
                      text: ' ($selectDifficultyEn)',
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 40.w),
              scrollDirection: Axis.horizontal,
              controller: difficultyLevelScrollController,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SelectDifficultyWidget(
                    title: DifficultyLevel.easy.name.titleCase(),
                    icon: AppAssets.images.jpegs.easy.path,
                    color: AppColors.green4C,
                    isSelected:
                        selectedDifficulty.value == DifficultyLevel.easy,
                    onTap: () {
                      selectedDifficulty.value = DifficultyLevel.easy;
                      Functions.autoScroll(
                        controller: difficultyLevelScrollController,
                        position: 0,
                      );
                    },
                  ),
                  _SelectDifficultyWidget(
                    title: DifficultyLevel.medium.name.titleCase(),
                    icon: AppAssets.images.jpegs.medium.path,
                    color: AppColors.blue07,
                    isSelected:
                        selectedDifficulty.value == DifficultyLevel.medium,
                    onTap: () {
                      selectedDifficulty.value = DifficultyLevel.medium;
                      Functions.autoScroll(
                        controller: difficultyLevelScrollController,
                        position: mqr.width * 0.1,
                      );
                    },
                  ),
                  _SelectDifficultyWidget(
                    title: DifficultyLevel.hard.name.titleCase(),
                    icon: AppAssets.images.jpegs.hard.path,
                    color: AppColors.redFF,
                    isSelected:
                        selectedDifficulty.value == DifficultyLevel.hard,
                    onTap: () {
                      selectedDifficulty.value = DifficultyLevel.hard;
                      Functions.autoScroll(
                        controller: difficultyLevelScrollController,
                        position: mqr.width * 0.1,
                      );
                    },
                  ),
                  _SelectDifficultyWidget(
                    title: DifficultyLevel.random.name.titleCase(),
                    icon: AppAssets.images.jpegs.random.path,
                    color: AppColors.black15,
                    isSelected:
                        selectedDifficulty.value == DifficultyLevel.random,
                    onTap: () {
                      selectedDifficulty.value = DifficultyLevel.random;
                      Functions.autoScroll(
                        controller: difficultyLevelScrollController,
                        position: mqr.width * 0.2,
                      );
                    },
                  ),
                ],
              ),
            ),
            if (isMultiPlayer) ...[
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(text: teamModeYr),
                          TextSpan(
                            text: ' ($teamModeEn)',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          const TextSpan(
                            text: '(Optional: ',
                          ),
                          TextSpan(
                            text: ' $invitingMoreThanFivePlayersEn)',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: AppColors.black.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectFilledCategoryWidget(
                            title: 'On',
                            isSelected: isTeamMode.value == true,
                            onTap: () => isTeamMode.value = true,
                          ),
                          SelectFilledCategoryWidget(
                            title: 'Off',
                            isSelected: isTeamMode.value == false,
                            onTap: () => isTeamMode.value = false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(text: teamFormationYr),
                          TextSpan(
                            text: ' ($teamFormationEn)',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectFilledCategoryWidget(
                            title: automaticYr,
                            isSelected: isTeamFormationAutomatic.value == true,
                            onTap: () => isTeamFormationAutomatic.value = true,
                          ),
                          SelectFilledCategoryWidget(
                            title: manualYr,
                            isSelected: isTeamFormationAutomatic.value == false,
                            onTap: () => isTeamFormationAutomatic.value = false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
            Center(
              child: Button(
                label: isMultiPlayer ? multiPlayerYr : '',
                width: mqr.width * 0.85,
                onPressed: () {
                  if (isMultiPlayer) {
                    context.pushNamed(
                      GameRoomCreatedScreen.id,
                      extra: {
                        'isTeamMode': isTeamMode.value,
                        'isTeamFormationAutomatic':
                            isTeamFormationAutomatic.value,
                      },
                    );
                  } else if (isSinglePlayer) {
                    context.pushNamed(
                      PlayQuestionScreen.id,
                      extra: {
                        'isSinglePlayer': true,
                      },
                    );
                  } else {
                    context.pushNamed(
                      PlayerIntroScreen.id,
                      extra: {
                        'isPractice': isPractice,
                        'isTimed': selectedPracticeSection.value == 'timed',
                      },
                    );
                  }
                },
                child: !isMultiPlayer
                    ? RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                          ),
                          children: [
                            const TextSpan(text: continueYr),
                            TextSpan(
                              text: ' ($continueEn)',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _SelectDifficultyWidget extends StatelessWidget {
  const _SelectDifficultyWidget({
    required this.title,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.36),
          ),
          child: Material(
            elevation: isSelected ? 10 : 0,
            shadowColor: AppColors.black,
            child: Container(
              padding: const EdgeInsets.fromLTRB(13.18, 0, 13.18, 6.91),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.36),
                color: color.withValues(alpha: 0.21),
                border: Border.all(
                  width: isSelected ? 0.9 : 0,
                  color: color,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(icon, scale: 2.25.sp),
                  Text(
                    title,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w400 : FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
