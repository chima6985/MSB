import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/features/game/cubits/reset_user_stats/reset_user_stats_cubit.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    super.key,
    this.isPractice = false,
    this.isSinglePlayer = false,
    this.isMultiPlayer = false,
    this.section,
  });

  final bool isPractice;
  final bool isSinglePlayer;
  final bool isMultiPlayer;
  final Section? section;

  static const String id = 'playerScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResetUserStatsCubit(
            authBloc: context.read(),
          ),
        ),
      ],
      child: _PlayerScreen(
        isPractice: isPractice,
        isSinglePlayer: isSinglePlayer,
        isMultiPlayer: isMultiPlayer,
        section: section,
      ),
    );
  }
}

class _PlayerScreen extends HookWidget {
  const _PlayerScreen({
    required this.isPractice,
    required this.isSinglePlayer,
    required this.isMultiPlayer,
    this.section,
  });

  final bool isPractice;
  final bool isSinglePlayer;
  final bool isMultiPlayer;
  final Section? section;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final isTimedPacticeMode = useState<bool?>(null);
    final isTeamMode = useState<bool?>(null);
    final isTeamFormationAutomatic = useState<bool?>(null);
    final mqr = MediaQuery.of(context).size;
    final selectedDifficulty = useState<Difficulty?>(null);
    final selectedSection = useState<Section?>(section);
    final categoryScrollController = useScrollController();
    final difficultyLevelScrollController = useScrollController();
    final isLoading = useState(false);
    final pageTitle = isPractice
        ? context.appLocale.practice
        : isSinglePlayer
            ? context.appLocale.singlePlayer
            : context.appLocale.multiPlayer;
    final moduleDifficulty =
        context.read<ModuleAndDifficultyCubit>().state.whenOrNull(
              loaded: (moduleDifficulty) => moduleDifficulty,
            );
    return MultiBlocListener(
      listeners: [
        BlocListener<ResetUserStatsCubit, ResetUserStatsState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => isLoading.value = true,
              loaded: () {
                isLoading.value = false;
                if (isMultiPlayer) {
                  context.pushNamed(
                    GameRoomCreatedScreen.id,
                    extra: {
                      'isTeamMode': isTeamMode.value,
                      'isTeamFormationAutomatic':
                          isTeamFormationAutomatic.value ?? false,
                    },
                  );
                }
                if (isSinglePlayer) {
                  context.read<GetQuestionCubit>().getSinglePlayerQuestions(
                        difficulty: selectedDifficulty.value?.id ?? '',
                        section: selectedSection.value?.id ?? '',
                      );
                }
                if (isPractice) {
                  context.pushNamed(
                    PlayerIntroScreen.id,
                    extra: {
                      'isTimed': isTimedPacticeMode.value,
                      'isPractice': true,
                      'questionSection': selectedSection.value,
                    },
                  );
                }
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
        ),
        BlocListener<GetQuestionCubit, GetQuestionState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => isLoading.value = true,
              loaded: (questions, lives) {
                isLoading.value = false;
                if (isMultiPlayer) {
                  context.pushNamed(
                    GameRoomCreatedScreen.id,
                    extra: {
                      'isTeamMode': isTeamMode.value,
                      'isTeamFormationAutomatic':
                          isTeamFormationAutomatic.value ?? false,
                    },
                  );
                }
                if (isSinglePlayer) {
                  context.pushNamed(
                    PlayerIntroScreen.id,
                    extra: {
                      'isSinglePlayer': true,
                      'questionSection': selectedSection.value,
                    },
                  );
                }
                if (isPractice) {
                  context.pushNamed(
                    PlayerIntroScreen.id,
                    extra: {
                      'isPractice': true,
                      'isTimed': isTimedPacticeMode.value,
                      'questionSection': selectedSection.value,
                    },
                  );
                }
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
        ),
      ],
      child: Scaffold(
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
                            pageTitle,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontFamily: FontFamily.margarine,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            currentLocale == yo
                                ? context.enLocale.modifyPlayMode
                                : context.yoLocale.modifyPlayMode,
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
              if (isPractice) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 10),
                  child: RichText(
                    text: TextSpan(
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: context.appLocale.selectPracticeMode,
                        ),
                        TextSpan(
                          text:
                              ' (${currentLocale == yo ? context.enLocale.selectPracticeMode : context.yoLocale.selectPracticeMode})',
                          style: context.textTheme.bodySmall!.copyWith(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 10),
                  child: RichText(
                    text: TextSpan(
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: context.appLocale.selectCategory,
                        ),
                        TextSpan(
                          text:
                              ' (${currentLocale == yo ? context.enLocale.selectCategory : context.yoLocale.selectCategory})',
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
                  children: [
                    if (isPractice) ...[
                      CategoryWidget(
                        title: 'Timed',
                        isSelected: isTimedPacticeMode.value == true,
                        onTap: () => isTimedPacticeMode.value = true,
                      ),
                      CategoryWidget(
                        title: 'Not timed',
                        isSelected: isTimedPacticeMode.value == false,
                        onTap: () => isTimedPacticeMode.value = false,
                      ),
                    ] else
                      ...moduleDifficulty!.sections.map(
                        (section) => CategoryWidget(
                          title: currentLocale == yo
                              ? section.yorubaSectionName
                              : section.sectionName,
                          isSelected: selectedSection.value == section,
                          onTap: () {
                            selectedSection.value = section;
                          },
                        ),
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
                      TextSpan(
                        text: context.appLocale.selectDifficulty,
                      ),
                      TextSpan(
                        text:
                            ' (${currentLocale == yo ? context.enLocale.selectDifficulty : context.yoLocale.selectDifficulty})',
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
                    ...moduleDifficulty!.difficulties.map(
                      (difficulty) => _SelectDifficultyWidget(
                        difficulty: difficulty,
                        isSelected: selectedDifficulty.value == difficulty,
                        onTap: () {
                          selectedDifficulty.value = difficulty;
                        },
                      ),
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
                              text: ' ()',
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
                              text: ' )',
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
                      SizedBox(height: 25.h),
                      if (isTeamMode.value != false) ...[
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              const TextSpan(text: teamFormationYr),
                              TextSpan(
                                text: ' ()',
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
                                isSelected:
                                    isTeamFormationAutomatic.value == true,
                                onTap: () =>
                                    isTeamFormationAutomatic.value = true,
                              ),
                              SelectFilledCategoryWidget(
                                title: manualYr,
                                isSelected:
                                    isTeamFormationAutomatic.value == false,
                                onTap: () =>
                                    isTeamFormationAutomatic.value = false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
              const Spacer(),
              Center(
                child: Button(
                  label: isMultiPlayer ? context.appLocale.multiPlayer : '',
                  width: mqr.width * 0.85,
                  isLoading: isLoading.value,
                  onPressed: () {
                    if (selectedSection.value == null) {
                      ToastMessage.showWarning(
                        context: context,
                        text: context.appLocale.pleaseChooseCategory,
                      );
                      return;
                    }
                    if (isPractice && isTimedPacticeMode.value == null) {
                      ToastMessage.showWarning(
                        context: context,
                        text: context.appLocale.pleaseSelectPracticeMode,
                      );
                      return;
                    }
                    if (selectedDifficulty.value == null) {
                      ToastMessage.showWarning(
                        context: context,
                        text: context.appLocale.pleaseChooseDifficultyLevel,
                      );
                      return;
                    }

                    if (isMultiPlayer) {
                      context.pushNamed(
                        GameRoomCreatedScreen.id,
                        extra: {
                          'isTeamMode': isTeamMode.value,
                          'isTeamFormationAutomatic':
                              isTeamFormationAutomatic.value ?? false,
                        },
                      );
                    }
                    context.read<ResetUserStatsCubit>().resetUserStats();
                  },
                  child: !isMultiPlayer
                      ? RichText(
                          text: TextSpan(
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                            ),
                            children: [
                              TextSpan(
                                text: context.appLocale.continueTx,
                              ),
                              TextSpan(
                                text:
                                    ' (${currentLocale == yo ? context.enLocale.continueTx : context.yoLocale.continueTx})',
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
      ),
    );
  }
}

class _SelectDifficultyWidget extends StatelessWidget {
  const _SelectDifficultyWidget({
    required this.difficulty,
    required this.isSelected,
    required this.onTap,
  });

  final Difficulty difficulty;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = {
      'Easy': AppColors.green4C,
      'Medium': AppColors.blue07,
      'Hard': AppColors.redFF,
      'Random': AppColors.black15,
    };
    final icon = {
      'Easy': AppAssets.images.jpegs.easy.path,
      'Medium': AppAssets.images.jpegs.medium.path,
      'Hard': AppAssets.images.jpegs.hard.path,
      'Random': AppAssets.images.jpegs.random.path,
    };
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
                color: (color[difficulty.name] ?? AppColors.black15)
                    .withValues(alpha: 0.21),
                border: Border.all(
                  width: isSelected ? 0.9 : 0,
                  color: color[''] ?? AppColors.black15,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    icon[difficulty.name] ?? AppAssets.images.jpegs.random.path,
                    scale: 2.25.sp,
                  ),
                  Text(
                    difficulty.name,
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
