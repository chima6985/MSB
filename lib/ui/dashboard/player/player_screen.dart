import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    super.key,
    this.isPractice = false,
    this.isSinglePlayer = false,
    this.isMultiPlayer = false,
  });

  final bool isPractice;
  final bool isSinglePlayer;
  final bool isMultiPlayer;

  static const String id = 'playerScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ModuleAndDifficultyCubit(
            authBloc: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => GetQuestionCubit(
            authBloc: context.read(),
          ),
        ),
      ],
      child: _PlayerScreen(
        isPractice: isPractice,
        isSinglePlayer: isSinglePlayer,
        isMultiPlayer: isMultiPlayer,
      ),
    );
  }
}

class _PlayerScreen extends HookWidget {
  const _PlayerScreen({
    required this.isPractice,
    required this.isSinglePlayer,
    required this.isMultiPlayer,
  });

  final bool isPractice;
  final bool isSinglePlayer;
  final bool isMultiPlayer;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final selectedPracticeSection = useState('');
    final isTeamMode = useState<bool?>(null);
    final isTeamFormationAutomatic = useState<bool?>(null);
    final mqr = MediaQuery.of(context).size;
    final selectedDifficulty = useState<Difficulty?>(null);
    final selectedModule = useState<Module?>(null);
    final categoryScrollController = useScrollController();
    final difficultyLevelScrollController = useScrollController();
    final isLoading = useState(false);
    const randomDifficulty = Difficulty(
      id: 'random',
      type: 'random',
      name: 'Random',
    );

    useEffect(
      () {
        context.read<ModuleAndDifficultyCubit>().getModulesAndDifficulty();
        return null;
      },
      [],
    );
    return MultiBlocListener(
      listeners: [
        BlocListener<GetQuestionCubit, GetQuestionState>(
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
                  context.pushNamed(
                    PlayQuestionScreen.id,
                    extra: {
                      'isSinglePlayer': true,
                    },
                  );
                }
                if (isPractice) {
                  context.pushNamed(
                    PlayerIntroScreen.id,
                    extra: {
                      'isPractice': isPractice,
                      'isTimed': selectedPracticeSection.value == 'timed',
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
                            context.appLocale.singlePlayer,
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
              Expanded(
                child: BlocBuilder<ModuleAndDifficultyCubit,
                    ModuleAndDifficultyState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      error: (error) => Column(
                        children: [
                          SizedBox(height: mqr.height * 0.2),
                          Text(
                            error ?? '',
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyLarge!.copyWith(),
                          ),
                          const SizedBox(height: 20),
                          Button(
                            width: mqr.width * 0.4,
                            label: context.appLocale.retry,
                            onPressed: () => context
                                .read<ModuleAndDifficultyCubit>()
                                .getModulesAndDifficulty(),
                          ),
                        ],
                      ),
                      loading: () => Column(
                        children: [
                          SizedBox(height: mqr.height * 0.2),
                          const CustomSpinner(color: AppColors.black),
                        ],
                      ),
                      loaded: (moduleDifficulty) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
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
                                    isSelected: selectedPracticeSection.value ==
                                        'timed',
                                    onTap: () =>
                                        selectedPracticeSection.value = 'timed',
                                  ),
                                  CategoryWidget(
                                    title: 'Not timed',
                                    isSelected: selectedPracticeSection.value ==
                                        'not_timed',
                                    onTap: () => selectedPracticeSection.value =
                                        'not_timed',
                                  ),
                                ] else
                                  ...moduleDifficulty.modules.map(
                                    (module) => CategoryWidget(
                                      title: module.moduleTitle,
                                      isSelected:
                                          selectedModule.value == module,
                                      onTap: () {
                                        selectedModule.value = module;
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
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
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
                                ...moduleDifficulty.difficulty.map(
                                  (difficulty) => _SelectDifficultyWidget(
                                    difficulty: difficulty,
                                    isSelected:
                                        selectedDifficulty.value == difficulty,
                                    onTap: () {
                                      selectedDifficulty.value = difficulty;
                                    },
                                  ),
                                ),
                                _SelectDifficultyWidget(
                                  difficulty: randomDifficulty,
                                  isSelected: selectedDifficulty.value ==
                                      randomDifficulty,
                                  onTap: () {
                                    selectedDifficulty.value = randomDifficulty;
                                    if (!context.isTablet) {
                                      Functions.autoScroll(
                                        controller:
                                            difficultyLevelScrollController,
                                        position: mqr.width * 0.15,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (isMultiPlayer) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 23, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          context.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        const TextSpan(text: teamModeYr),
                                        TextSpan(
                                          text: ' ()',
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
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
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: '(Optional: ',
                                        ),
                                        TextSpan(
                                          text: ' )',
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                            color: AppColors.black
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        style: context.textTheme.bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          const TextSpan(text: teamFormationYr),
                                          TextSpan(
                                            text: ' ()',
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SelectFilledCategoryWidget(
                                            title: automaticYr,
                                            isSelected: isTeamFormationAutomatic
                                                    .value ==
                                                true,
                                            onTap: () =>
                                                isTeamFormationAutomatic.value =
                                                    true,
                                          ),
                                          SelectFilledCategoryWidget(
                                            title: manualYr,
                                            isSelected: isTeamFormationAutomatic
                                                    .value ==
                                                false,
                                            onTap: () =>
                                                isTeamFormationAutomatic.value =
                                                    false,
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
                              label: isMultiPlayer
                                  ? context.appLocale.multiPlayer
                                  : '',
                              width: mqr.width * 0.85,
                              isLoading: isLoading.value,
                              onPressed: () {
                                if (isMultiPlayer) {
                                  context.pushNamed(
                                    GameRoomCreatedScreen.id,
                                    extra: {
                                      'isTeamMode': isTeamMode.value,
                                      'isTeamFormationAutomatic':
                                          isTeamFormationAutomatic.value ??
                                              false,
                                    },
                                  );
                                }
                                if (isSinglePlayer) {
                                  if (selectedDifficulty.value == null) {
                                    ToastMessage.showWarning(
                                      context: context,
                                      text: context.appLocale
                                          .pleaseChooseDifficultyLevel,
                                    );
                                    return;
                                  }
                                  if (selectedModule.value == null) {
                                    ToastMessage.showWarning(
                                      context: context,
                                      text: context
                                          .appLocale.pleaseChooseCategory,
                                    );
                                    return;
                                  }
                                  context
                                      .read<GetQuestionCubit>()
                                      .getSinglePlayerQuestions(
                                        difficulty:
                                            selectedDifficulty.value?.id ?? '',
                                        section: selectedModule.value?.id ?? '',
                                      );
                                }
                                if (isPractice) {
                                  context.pushNamed(
                                    PlayerIntroScreen.id,
                                    extra: {
                                      'isPractice': isPractice,
                                      'isTimed':
                                          selectedPracticeSection.value ==
                                              'timed',
                                    },
                                  );
                                }
                              },
                              child: !isMultiPlayer
                                  ? RichText(
                                      text: TextSpan(
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          color: AppColors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: context.appLocale.continueTx,
                                          ),
                                          TextSpan(
                                            text:
                                                ' (${currentLocale == yo ? context.enLocale.continueTx : context.yoLocale.continueTx})',
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
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
                      orElse: SizedBox.new,
                    );
                  },
                ),
              ),
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
