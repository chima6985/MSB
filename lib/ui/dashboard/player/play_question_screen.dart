import 'dart:math';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlayQuestionScreen extends StatelessWidget {
  const PlayQuestionScreen({
    super.key,
    this.isPractice = false,
    this.isTimed = false,
    this.isSinglePlayer = false,
    this.isTeamLeader = false,
    this.isMultiPlayer = false,
    this.isGameMaster = false,
    this.questionSection,
    this.totalLives,
  });

  final bool isPractice,
      isTimed,
      isSinglePlayer,
      isTeamLeader,
      isMultiPlayer,
      isGameMaster;
  final Section? questionSection;
  final int? totalLives;

  static const String id = 'playQuestionScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitAnswerCubit(
        authBloc: context.read(),
      ),
      child: __PlayQuestionScreen(
        isPractice: isPractice,
        isTimed: isTimed,
        isSinglePlayer: isSinglePlayer,
        isTeamLeader: isTeamLeader,
        isMultiPlayer: isMultiPlayer,
        isGameMaster: isGameMaster,
        questionSection: questionSection,
        totalLives: totalLives,
      ),
    );
  }
}

class __PlayQuestionScreen extends StatefulWidget {
  const __PlayQuestionScreen({
    this.isPractice = false,
    this.isTimed = false,
    this.isSinglePlayer = false,
    this.isTeamLeader = false,
    this.isMultiPlayer = false,
    this.isGameMaster = false,
    this.questionSection,
    this.totalLives,
  });

  final bool isPractice,
      isTimed,
      isSinglePlayer,
      isTeamLeader,
      isMultiPlayer,
      isGameMaster;
  final Section? questionSection;
  final int? totalLives;

  @override
  State<__PlayQuestionScreen> createState() => __PlayQuestionScreenState();
}

class __PlayQuestionScreenState extends State<__PlayQuestionScreen>
    with TickerProviderStateMixin {
  CustomTimerController? timerCountDownController;
  List<String> correctWordTile = ['P', 'E', 'L', 'U', 'M', 'I'];
  bool isActivateNextButton = false;
  bool? isWordTileArrangedCorrectly;
  String? selectedMultipleOption;
  final selectedMultipleOptionAnswer = 'Asiiro';
  bool? isMultipleOption;
  final answerController = TextEditingController();
  String? selectedFillWordOption;
  bool isMultiplayerAnswerSelected = false;
  String? imageSelector;
  bool isLoading = false;
  int livesRemaining = 0;
  // ignore: prefer_const_declarations
  int currentQuestionIndex = 0;
  bool showFrontSide = true;
  bool flipXAxis = true;
  final stopwatch = Stopwatch();

  @override
  void initState() {
    final questions = context.read<GetQuestionCubit>().state.whenOrNull(
              loaded: (questions, lives) => questions,
            ) ??
        <Question>[];
    setState(() {
      livesRemaining = widget.totalLives ?? 0;
    });
    if (widget.isTimed || widget.isSinglePlayer) {
      timerCountDownController = CustomTimerController(
        begin: Duration(
          seconds: questions.isNotEmpty ? questions.first.timeLimit : 0,
        ),
        end: Duration.zero,
        vsync: this,
      )..start();
    }
    if (widget.isPractice) {
      stopwatch.start();
    }
    super.initState();
  }

  @override
  void dispose() {
    answerController.dispose();
    timerCountDownController?.dispose();
    stopwatch.stop();
    // answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final enSectionName = widget.questionSection?.sectionName.titleCase() ?? '';
    final yoSectionName =
        widget.questionSection?.yorubaSectionName.titleCase() ?? '';

    final isPracticeMode = widget.isPractice;

    final isSinglePlayerMode = widget.isSinglePlayer;

    final isMultiPlayerMode = widget.isMultiPlayer;

    final isMultiPlayerTeamLeaderMode =
        widget.isMultiPlayer && widget.isTeamLeader;

    final isMultiPlayerGameMasterMode =
        widget.isMultiPlayer && widget.isTeamLeader;

    final title = isPracticeMode
        ? context.appLocale.practice
        : isSinglePlayerMode
            ? context.appLocale.singlePlayer
            : context.appLocale.multiPlayer;

    final bgColor = {
      true: AppColors.greenCE,
      false: AppColors.redFF.withValues(alpha: 0.2),
    };

    final brColor = {
      true: AppColors.green62,
      false: AppColors.redFF,
    };

    final questions = context.read<GetQuestionCubit>().state.whenOrNull(
              loaded: (questions, lives) => questions,
            ) ??
        <Question>[];

    return BlocListener<SubmitAnswerCubit, SubmitAnswerState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            timerCountDownController?.pause();
            setState(
              () => isLoading = true,
            );
          },
          loaded: (answer) {
            timerCountDownController?.reset();
            if (isPracticeMode || isSinglePlayerMode) {
              if (isPracticeMode) {
                stopwatch.reset();
                setState(() => showFrontSide = true);
              }
              if (isSinglePlayerMode && answer.totalLives == 0) {
                // get user stats and leave game session
                setState(() => isLoading = false);
                context.pushReplacementNamed(RanOutOfLivesScreen.id);
              } else {
                setState(
                  () {
                    isLoading = false;
                    livesRemaining = answer.totalLives;
                  },
                );
                //Toast Logic
                if (isPracticeMode) {
                  // dont show toast if user flips
                  if (answerController.text.trim() == 'flipped') {
                    ToastMessage.showInformation(
                      context: context,
                      text: context.appLocale.questionFlipped,
                    );
                  } else {
                    if (answer.message.toLowerCase().contains('incorrect')) {
                      ToastMessage.showWarning(
                        context: context,
                        text: answer.message,
                      );
                    } else {
                      ToastMessage.showSuccess(
                        context: context,
                        text: answer.message,
                      );
                    }
                  }
                }
                if (isSinglePlayerMode) {
                  if (answer.message.toLowerCase().contains('incorrect')) {
                    ToastMessage.showWarning(
                      context: context,
                      text: answer.message,
                    );
                  } else {
                    ToastMessage.showSuccess(
                      context: context,
                      text: answer.message,
                    );
                  }
                }

                if ((currentQuestionIndex + 1) < questions.length) {
                  // questions can still be served
                  setState(() => currentQuestionIndex++);
                  answerController.clear();
                  timerCountDownController?.start();
                } else {
                  // ran out of questions, push user to game stats
                  context.pushReplacementNamed(
                    PlayerGameAnalyticsScreen.id,
                    extra: {'isPractice': isPracticeMode},
                  );
                }
              }
            } else {}
          },
          error: (error) {
            timerCountDownController?.start();
            setState(
              () {
                isLoading = false;
              },
            );
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => setState(
            () => isLoading = false,
          ),
        );
      },
      child: Scaffold(
        body: PopScope(
          canPop: !isLoading,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              DecoratedContainer(
                child: AbsorbPointer(
                  absorbing: isLoading,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: RawScrollbar(
                      thumbColor: AppColors.black15.withValues(alpha: 0.6),
                      radius: const Radius.circular(5),
                      thickness: 2,
                      thumbVisibility: true,
                      minOverscrollLength: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.topPadding),
                            Stack(
                              children: [
                                CustomBackButton(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => isPracticeMode
                                        ? const ConfirmPracticeLeaveActionModal()
                                        : const ConfirmLeaveActionModal(),
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    textScaler: TextScaler.noScaling,
                                    style:
                                        context.textTheme.titleLarge!.copyWith(
                                      fontFamily: FontFamily.margarine,
                                      height: 1.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23),
                              child: Column(
                                children: [
                                  if (isPracticeMode || isSinglePlayerMode) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            alignment: Alignment.centerLeft,
                                            fit: BoxFit.scaleDown,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  currentLocale == yo
                                                      ? yoSectionName
                                                      : enSectionName,
                                                  textAlign: TextAlign.center,
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                  style: context
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                    fontFamily:
                                                        FontFamily.margarine,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  currentLocale == yo
                                                      ? enSectionName
                                                      : yoSectionName,
                                                  textAlign: TextAlign.start,
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                  style: context
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                    fontFamily:
                                                        FontFamily.margarine,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.goldFC
                                                .withValues(alpha: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: AppColors.goldCE,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AppAssets.images.jpegs.coin2
                                                  .image(
                                                width: 24.w,
                                                height: 24.w,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '0',
                                                textScaler:
                                                    TextScaler.noScaling,
                                                style: context
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                  color: AppColors.goldCE,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40.h),
                                  ],
                                  BlocBuilder<GetQuestionCubit,
                                      GetQuestionState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        loaded: (question, lives) {
                                          AnswerFormat? answerFormat =
                                              const AnswerFormat(
                                            answer: Answer(),
                                            format: 'text',
                                          );
                                          final questions = question;
                                          final currentQuestion =
                                              currentQuestionIndex <
                                                      questions.length
                                                  ? questions[
                                                      currentQuestionIndex]
                                                  : null;
                                          final currentQuestionText =
                                              (currentQuestion?.question
                                                          .contains('?') ??
                                                      false)
                                                  ? currentQuestion?.question
                                                          .capitalize() ??
                                                      ''
                                                  : '${currentQuestion?.question.capitalize()}?';
                                          final currentAltQuestionText =
                                              '${currentQuestion?.translateQuestion.capitalize() ?? ''}?';
                                          final answer =
                                              currentQuestion?.answer;

                                          if (answer?.isNotEmpty ?? false) {
                                            if (currentQuestion
                                                    ?.shuffleAnswers ==
                                                true) {
                                              final newAnswers =
                                                  List.from(answer ?? [])
                                                    ..add(
                                                      AnswerFormat(
                                                        answer: Answer(
                                                          value: currentQuestion
                                                              ?.correctAnswer
                                                              .shuffleWord(),
                                                        ),
                                                        format: 'tile',
                                                      ),
                                                    )
                                                    ..shuffle();
                                              answerFormat = newAnswers.first;
                                            } else {
                                              answerFormat = answer?.first;
                                            }
                                          }
                                          return Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: isPracticeMode ||
                                                          isSinglePlayerMode
                                                      ? 23
                                                      : 13,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            currentLocale == yo
                                                                ? yoQuestionNumberSystem[
                                                                        currentQuestionIndex +
                                                                            1] ??
                                                                    context
                                                                        .yoLocale
                                                                        .question
                                                                : enQuestionNumberSystem[
                                                                        currentQuestionIndex +
                                                                            1] ??
                                                                    context
                                                                        .enLocale
                                                                        .question,
                                                            textAlign: TextAlign
                                                                .center,
                                                            textScaler:
                                                                TextScaler
                                                                    .noScaling,
                                                            style: context
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            currentLocale == yo
                                                                ? enQuestionNumberSystem[
                                                                        currentQuestionIndex +
                                                                            1] ??
                                                                    context
                                                                        .enLocale
                                                                        .question
                                                                : yoQuestionNumberSystem[
                                                                        currentQuestionIndex +
                                                                            1] ??
                                                                    context
                                                                        .yoLocale
                                                                        .question,
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaler:
                                                                TextScaler
                                                                    .noScaling,
                                                            style: context
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    if ((currentQuestion
                                                                    ?.timeLimit ??
                                                                0) >
                                                            0 &&
                                                        widget.isTimed)
                                                      CustomTimer(
                                                        controller:
                                                            timerCountDownController!,
                                                        builder:
                                                            (state, timer) {
                                                          if (state ==
                                                                  CustomTimerState
                                                                      .finished &&
                                                              isLoading ==
                                                                  false) {
                                                            context
                                                                .read<
                                                                    SubmitAnswerCubit>()
                                                                .submitAnswer(
                                                                  questionId:
                                                                      currentQuestion
                                                                              ?.id ??
                                                                          '',
                                                                  answer: '',
                                                                  startTime: isPracticeMode
                                                                      ? stopwatch
                                                                          .elapsed
                                                                          .inSeconds
                                                                      : 30,
                                                                  isPractice:
                                                                      isPracticeMode,
                                                                );
                                                          }
                                                          final time = (double
                                                                      .tryParse(
                                                                    timer
                                                                        .seconds,
                                                                  ) ??
                                                                  1) /
                                                              (currentQuestion
                                                                      ?.timeLimit ??
                                                                  1);
                                                          return FittedBox(
                                                            child:
                                                                CircularPercentIndicator(
                                                              radius: 23,
                                                              lineWidth: 6.6,
                                                              backgroundWidth:
                                                                  1.2,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              percent: time > 1
                                                                  ? 1
                                                                  : time,
                                                              center: Text(
                                                                timerCountDownController
                                                                        ?.remaining
                                                                        .value
                                                                        .seconds ??
                                                                    '',
                                                                textScaler:
                                                                    TextScaler
                                                                        .noScaling,
                                                                style: context
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              circularStrokeCap:
                                                                  CircularStrokeCap
                                                                      .round,
                                                              backgroundColor:
                                                                  AppColors
                                                                      .greyB6,
                                                              progressColor:
                                                                  AppColors
                                                                      .goldFC,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              AnimatedSwitcher(
                                                duration: 800.ms,
                                                transitionBuilder:
                                                    __transitionBuilder,
                                                layoutBuilder: (widget, list) =>
                                                    Stack(
                                                  children: [
                                                    widget ?? const SizedBox(),
                                                    ...list,
                                                  ],
                                                ),
                                                switchInCurve:
                                                    Curves.easeInBack,
                                                switchOutCurve:
                                                    Curves.easeInBack.flipped,
                                                child: showFrontSide
                                                    ? QuestionCard(
                                                        currentQuestionIndex:
                                                            currentQuestionIndex,
                                                        totalNoOfQuestions:
                                                            questions.length,
                                                        isPracticeMode:
                                                            isPracticeMode,
                                                        isSinglePlayerMode:
                                                            isSinglePlayerMode,
                                                        totalLives:
                                                            widget.totalLives,
                                                        livesRemaining:
                                                            livesRemaining,
                                                        currentAltQuestionText:
                                                            currentAltQuestionText,
                                                        currentQuestionText:
                                                            currentQuestionText,
                                                        onFlipPressed: () {
                                                          answerController
                                                              .text = 'flipped';
                                                          setState(() {
                                                            showFrontSide =
                                                                false;
                                                          });
                                                        },
                                                      )
                                                    : FlippedQuestionCard(
                                                        currentQuestionIndex:
                                                            currentQuestionIndex,
                                                        totalNoOfQuestions:
                                                            questions.length,
                                                        isPracticeMode:
                                                            isPracticeMode,
                                                        answer: answer,
                                                      ),
                                              ),
                                              SizedBox(
                                                height: 28.h +
                                                    (!showFrontSide ? 40.h : 0),
                                              ),
                                              if (showFrontSide) ...[
                                                if (isMultiPlayerMode ||
                                                    isMultiPlayerTeamLeaderMode ||
                                                    isMultiPlayerGameMasterMode) ...[
                                                  Center(
                                                    child: Text(
                                                      '* Select your answers from the options below',
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaler:
                                                          TextScaler.noScaling,
                                                      style: context
                                                          .textTheme.bodySmall!
                                                          .copyWith(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  SelectCategoryWidget2(
                                                    title: 'Tiiro',
                                                    isSelected:
                                                        selectedMultipleOption ==
                                                            'Tiiro',
                                                    isShowBgColor: false,
                                                    voteIndicator:
                                                        selectedMultipleOption ==
                                                                'Tiiro'
                                                            ? '4'
                                                            : '3',
                                                    bgColor: bgColor[
                                                        isMultipleOption],
                                                    brColor: brColor[
                                                        isMultipleOption],
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedMultipleOption ==
                                                            'Tiiro') {
                                                          selectedMultipleOption =
                                                              null;
                                                        } else {
                                                          selectedMultipleOption =
                                                              'Tiiro';
                                                          isMultiplayerAnswerSelected =
                                                              false;
                                                          isMultipleOption =
                                                              null;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  SelectCategoryWidget2(
                                                    title: 'Asiiro',
                                                    isSelected:
                                                        selectedMultipleOption ==
                                                            'Asiiro',
                                                    isShowBgColor: false,
                                                    voteIndicator:
                                                        selectedMultipleOption ==
                                                                'Asiiro'
                                                            ? '1'
                                                            : null,
                                                    bgColor: bgColor[
                                                        isMultipleOption],
                                                    brColor: brColor[
                                                        isMultipleOption],
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedMultipleOption ==
                                                            'Asiiro') {
                                                          selectedMultipleOption =
                                                              null;
                                                        } else {
                                                          selectedMultipleOption =
                                                              'Asiiro';
                                                          isMultiplayerAnswerSelected =
                                                              false;
                                                          isMultipleOption =
                                                              null;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  SelectCategoryWidget2(
                                                    title: 'Asiiro',
                                                    isSelected:
                                                        selectedMultipleOption ==
                                                            'Asiiroo',
                                                    isShowBgColor: false,
                                                    voteIndicator:
                                                        selectedMultipleOption ==
                                                                'Asiiroo'
                                                            ? '1'
                                                            : null,
                                                    bgColor: bgColor[
                                                        isMultipleOption],
                                                    brColor: brColor[
                                                        isMultipleOption],
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedMultipleOption ==
                                                            'Asiiroo') {
                                                          selectedMultipleOption =
                                                              null;
                                                        } else {
                                                          selectedMultipleOption =
                                                              'Asiiroo';
                                                          isMultiplayerAnswerSelected =
                                                              false;
                                                          isMultipleOption =
                                                              null;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  if (isMultiplayerAnswerSelected) ...[
                                                    SizedBox(height: 25.h),
                                                    Center(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            waitingForTeamLeaderToSubmitFinalAnswerYr,
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaler:
                                                                TextScaler
                                                                    .noScaling,
                                                            style: context
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                          const TypeWriterProgressTextIndicator(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            isItalic: true,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                  SizedBox(height: 24.h),
                                                  if (widget.isTeamLeader)
                                                    SizedBox(height: 150.h)
                                                  else
                                                    AbsorbPointer(
                                                      absorbing:
                                                          isMultiplayerAnswerSelected ==
                                                                  true ||
                                                              selectedMultipleOption ==
                                                                  null,
                                                      child: Opacity(
                                                        opacity:
                                                            (isMultiplayerAnswerSelected ==
                                                                        false &&
                                                                    selectedMultipleOption !=
                                                                        null)
                                                                ? 1
                                                                : 0.4,
                                                        child: Button(
                                                          label: voteYr,
                                                          onPressed: () async {
                                                            await Future
                                                                .delayed(
                                                              1.seconds,
                                                            );
                                                            setState(() {
                                                              isMultiplayerAnswerSelected =
                                                                  true;
                                                            });
                                                            await Future
                                                                .delayed(
                                                              3.seconds,
                                                            ).then((_) {
                                                              if (context
                                                                  .mounted) {
                                                                showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  isDismissible:
                                                                      false,
                                                                  barrierColor:
                                                                      AppColors
                                                                          .transparent,
                                                                  builder:
                                                                      (context) =>
                                                                          const PerformanceModal(
                                                                    type:
                                                                        'success',
                                                                  ),
                                                                ).then((_) {
                                                                  setState(() {
                                                                    isMultiplayerAnswerSelected =
                                                                        false;
                                                                    selectedMultipleOption =
                                                                        null;
                                                                  });
                                                                });
                                                              }
                                                            });
                                                          },
                                                          onLongPress:
                                                              () async {
                                                            await Future
                                                                .delayed(
                                                              1.seconds,
                                                            );
                                                            setState(() {
                                                              isMultiplayerAnswerSelected =
                                                                  true;
                                                            });
                                                            await Future
                                                                .delayed(
                                                              3.seconds,
                                                            ).then((_) {
                                                              if (context
                                                                  .mounted) {
                                                                showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  isDismissible:
                                                                      false,
                                                                  barrierColor:
                                                                      AppColors
                                                                          .transparent,
                                                                  builder:
                                                                      (context) =>
                                                                          const PerformanceModal(
                                                                    type:
                                                                        'failure',
                                                                  ),
                                                                ).then((_) {
                                                                  setState(() {
                                                                    isMultiplayerAnswerSelected =
                                                                        false;
                                                                    selectedMultipleOption =
                                                                        null;
                                                                  });
                                                                });
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ] else ...[
                                                  if (answerFormat?.format ==
                                                      'tile') ...[
                                                    SizedBox(
                                                      height: 45.h,
                                                      child:
                                                          ReorderableListView(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        onReorder: (i, j) {
                                                          final wordTile =
                                                              answerFormat
                                                                      ?.answer
                                                                      .value
                                                                      ?.split(
                                                                    '',
                                                                  ) ??
                                                                  [];
                                                          setState(() {
                                                            if (j > i) j--;
                                                            final tile =
                                                                wordTile
                                                                    .removeAt(
                                                              i,
                                                            );
                                                            wordTile.insert(
                                                              j,
                                                              tile,
                                                            );
                                                            isActivateNextButton =
                                                                true;
                                                            isWordTileArrangedCorrectly =
                                                                null;
                                                          });
                                                        },
                                                        children: [
                                                          for (int i = 0;
                                                              i <
                                                                  (answerFormat
                                                                          ?.answer
                                                                          .value
                                                                          ?.length ??
                                                                      0);
                                                              i++)
                                                            Padding(
                                                              key: ValueKey(i),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                4,
                                                              ),
                                                              child: Container(
                                                                width: 32.w,
                                                                height: 32.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: bgColor[
                                                                          isWordTileArrangedCorrectly] ??
                                                                      AppColors
                                                                          .blueE7,
                                                                  border: Border
                                                                      .all(
                                                                    color: brColor[
                                                                            isWordTileArrangedCorrectly] ??
                                                                        AppColors
                                                                            .greyB6,
                                                                    width: 0.6,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    4,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    answerFormat
                                                                            ?.answer
                                                                            .value
                                                                            ?.split(
                                                                          '',
                                                                        )[i] ??
                                                                        '',
                                                                    textScaler:
                                                                        TextScaler
                                                                            .noScaling,
                                                                    style: context
                                                                        .textTheme
                                                                        .bodyLarge!
                                                                        .copyWith(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Center(
                                                      child: Text(
                                                        '* Long press on a tile to move and form the word',
                                                        textAlign:
                                                            TextAlign.start,
                                                        textScaler: TextScaler
                                                            .noScaling,
                                                        style: context.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ] else if (answerFormat
                                                          ?.format ==
                                                      'text') ...[
                                                    SizedBox(height: 20.h),
                                                    CustomTextField(
                                                      textEditingController:
                                                          answerController,
                                                      textFieldText:
                                                          writeYourAnswerHereYr,
                                                    ),
                                                  ] else if (answerFormat
                                                          ?.format ==
                                                      'multi-choice') ...[
                                                    Center(
                                                      child: Text(
                                                        '* $selectAnswersFromOptionBelowYr',
                                                        textAlign:
                                                            TextAlign.start,
                                                        textScaler: TextScaler
                                                            .noScaling,
                                                        style: context.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 16.h),
                                                    SelectCategoryWidget2(
                                                      title: 'Tiiro',
                                                      isSelected:
                                                          selectedMultipleOption ==
                                                              'Tiiro',
                                                      bgColor: bgColor[
                                                          isMultipleOption],
                                                      brColor: brColor[
                                                          isMultipleOption],
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedMultipleOption ==
                                                              'Tiiro') {
                                                            selectedMultipleOption =
                                                                null;
                                                            isMultipleOption =
                                                                null;
                                                          } else {
                                                            selectedMultipleOption =
                                                                'Tiiro';
                                                            isMultipleOption =
                                                                null;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    SelectCategoryWidget2(
                                                      title: 'Asiiro',
                                                      isSelected:
                                                          selectedMultipleOption ==
                                                              'Asiiro',
                                                      bgColor: bgColor[
                                                          isMultipleOption],
                                                      brColor: brColor[
                                                          isMultipleOption],
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedMultipleOption ==
                                                              'Asiiro') {
                                                            selectedMultipleOption =
                                                                null;
                                                            isMultipleOption =
                                                                null;
                                                          } else {
                                                            selectedMultipleOption =
                                                                'Asiiro';
                                                            isMultipleOption =
                                                                null;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    SelectCategoryWidget2(
                                                      title: 'Asiiro',
                                                      isSelected:
                                                          selectedMultipleOption ==
                                                              'Asiiroo',
                                                      bgColor: bgColor[
                                                          isMultipleOption],
                                                      brColor: brColor[
                                                          isMultipleOption],
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedMultipleOption ==
                                                              'Asiiroo') {
                                                            selectedMultipleOption =
                                                                null;
                                                            isMultipleOption =
                                                                null;
                                                          } else {
                                                            selectedMultipleOption =
                                                                'Asiiroo';
                                                            isMultipleOption =
                                                                null;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ],
                                                if (answerFormat?.format ==
                                                    'multi-choice')
                                                  SizedBox(height: 20.h)
                                                else
                                                  SizedBox(height: 40.h),
                                              ],
                                              ListenableBuilder(
                                                listenable: answerController,
                                                builder: (context, child) {
                                                  return Opacity(
                                                    opacity: answerController
                                                            .text.isNotEmpty
                                                        ? 1
                                                        : 0.7,
                                                    child: Button(
                                                      width: mqr.width * 0.8,
                                                      label: context
                                                          .appLocale.next,
                                                      isLoading: isLoading,
                                                      onPressed: () {
                                                        if (answerController
                                                            .text.isEmpty) {
                                                          ToastMessage
                                                              .showWarning(
                                                            context: context,
                                                            text: context
                                                                .appLocale
                                                                .pleaseTypeInYourAnswer,
                                                          );
                                                          return;
                                                        }
                                                        context
                                                            .read<
                                                                SubmitAnswerCubit>()
                                                            .submitAnswer(
                                                              questionId:
                                                                  currentQuestion
                                                                          ?.id ??
                                                                      '',
                                                              answer:
                                                                  answerController
                                                                      .text
                                                                      .trim(),
                                                              startTime:
                                                                  isPracticeMode
                                                                      ? stopwatch
                                                                          .elapsed
                                                                          .inSeconds
                                                                      : 30 -
                                                                          (int.parse(
                                                                            timerCountDownController?.remaining.value.seconds ??
                                                                                '0',
                                                                          )),
                                                              isPractice:
                                                                  isPracticeMode,
                                                            );
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();

                                                        // var isWordCorrect = false;
                                                        // for (var i = 0;
                                                        //     i < wordTile.length;
                                                        //     i++) {
                                                        //   if (wordTile[i] !=
                                                        //       correctWordTile[i]) {
                                                        //     isWordCorrect = false;
                                                        //     break;
                                                        //   } else {
                                                        //     isWordCorrect = true;
                                                        //   }
                                                        // }
                                                        // setState(() {
                                                        //   if (isWordCorrect) {
                                                        //     isWordTileArrangedCorrectly =
                                                        //         true;
                                                        //   } else {
                                                        //     isWordTileArrangedCorrectly =
                                                        //         false;
                                                        //   }
                                                        // });
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                        orElse: SizedBox.new,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.btmPadding),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // if (widget.isTeamLeader)
              //   Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     decoration: BoxDecoration(
              //       color: AppColors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.black.withValues(alpha: 0.15),
              //           blurRadius: 11,
              //           spreadRadius: 1,
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         const SizedBox(height: 20),
              //         Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             AppAssets.images.svgs.thumbs.svg(),
              //             const SizedBox(width: 5),
              //             Text(
              //               'Final Answer',
              //               textAlign: TextAlign.center,
              //               style: context.textTheme.bodyMedium!.copyWith(
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 16.h),
              //         Text(
              //           'Select your teams final answer',
              //           textAlign: TextAlign.center,
              //           style: context.textTheme.bodyMedium!.copyWith(
              //             fontWeight: FontWeight.w300,
              //           ),
              //         ),
              //         SizedBox(height: 24.h),
              //         AbsorbPointer(
              //           absorbing: isMultiplayerAnswerSelected == true ||
              //               selectedMultipleOption == null,
              //           child: Opacity(
              //             opacity: (isMultiplayerAnswerSelected == false &&
              //                     selectedMultipleOption != null)
              //                 ? 1
              //                 : 0.4,
              //             child: Button(
              //               label: voteYr,
              //               onPressed: () async {
              //                 await Future.delayed(1.seconds);
              //                 setState(() {
              //                   isMultiplayerAnswerSelected = true;
              //                 });
              //                 await Future.delayed(3.seconds).then((_) {
              //                   if (context.mounted) {
              //                     showModalBottomSheet(
              //                       context: context,
              //                       isDismissible: false,
              //                       barrierColor: AppColors.transparent,
              //                       builder: (context) => const PerformanceModal(
              //                         type: 'success',
              //                       ),
              //                     ).then((_) {
              //                       setState(() {
              //                         isMultiplayerAnswerSelected = false;
              //                         selectedMultipleOption = null;
              //                       });
              //                     });
              //                   }
              //                 });
              //               },
              //               onLongPress: () async {
              //                 await Future.delayed(1.seconds);
              //                 setState(() {
              //                   isMultiplayerAnswerSelected = true;
              //                 });
              //                 await Future.delayed(3.seconds).then((_) {
              //                   if (context.mounted) {
              //                     showModalBottomSheet(
              //                       context: context,
              //                       isDismissible: false,
              //                       barrierColor: AppColors.transparent,
              //                       builder: (context) => const PerformanceModal(
              //                         type: 'failure',
              //                       ),
              //                     ).then((_) {
              //                       setState(() {
              //                         isMultiplayerAnswerSelected = false;
              //                         selectedMultipleOption = null;
              //                       });
              //                     });
              //                   }
              //                 });
              //               },
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: context.btmPadding),
              //       ],
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    // ignore: prefer_int_literals
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}

// other question answer formats

// class _ImagePickerOption extends StatelessWidget {
//   const _ImagePickerOption({
//     required this.imageTitle,
//     required this.onTap,
//     this.isSelected = false,
//   });

//   final String imageTitle;
//   final VoidCallback onTap;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 14,
//               vertical: 10,
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: isSelected ? AppColors.blue12 : AppColors.greyDB,
//               ),
//               boxShadow: isSelected
//                   ? [
//                       BoxShadow(
//                         color: AppColors.black.withValues(alpha: 0.2),
//                         blurRadius: 10,
//                       ),
//                     ]
//                   : null,
//             ),
//             child: Container(
//               width: 100.w,
//               height: 100.w,
//               decoration: BoxDecoration(
//                 color: AppColors.greyB6.withValues(alpha: 0.4),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             imageTitle,
//             textAlign: TextAlign.center,
//             style: context.textTheme.bodyMedium!.copyWith(
//               fontSize: 15.sp,
//               fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// Center(
//                                           child: Text(
//                                             '* $formTheSentenceYr',
//                                             textAlign: TextAlign.start,
//                                             style: context.textTheme.bodySmall!
//                                                 .copyWith(
//                                               fontStyle: FontStyle.italic,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                         ),
                                        // SizedBox(height: 16.h),
// Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             CategoryWidget(
//                                               title: 'ògún',
//                                               isSelected:
//                                                   selectedFillWordOption ==
//                                                       'ògún',
//                                               onTap: () {
//                                                 setState(() {
//                                                   if (selectedFillWordOption ==
//                                                       'ògún') {
//                                                     selectedFillWordOption =
//                                                         null;
//                                                   } else {
//                                                     selectedFillWordOption =
//                                                         'ògún';
//                                                   }
//                                                 });
//                                               },
//                                             ),
//                                             CategoryWidget(
//                                               title: 'ogun',
//                                               isSelected:
//                                                   selectedFillWordOption ==
//                                                       'ogun',
//                                               onTap: () {
//                                                 setState(() {
//                                                   if (selectedFillWordOption ==
//                                                       'ogun') {
//                                                     selectedFillWordOption =
//                                                         null;
//                                                   } else {
//                                                     selectedFillWordOption =
//                                                         'ogun';
//                                                   }
//                                                 });
//                                               },
//                                             ),
//                                           ],
//                                         ),
// SizedBox(height: 40.h),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Transform.translate(
//                                   offset: const Offset(0, 5),
//                                   child: AppAssets.images.svgs.listen.svg(
//                                     width: 17.sp,
//                                     height: 17.sp,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       selectMatchingImageYr,
//                                       textAlign: TextAlign.center,
//                                       style: context.textTheme.bodyMedium!
//                                           .copyWith(
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       selectMatchingImageEn,
//                                       textAlign: TextAlign.start,
//                                       style:
//                                           context.textTheme.bodySmall!.copyWith(
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       'ilú',
//                                       textAlign: TextAlign.center,
//                                       style: context.textTheme.bodyMedium!
//                                           .copyWith(
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 32.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _ImagePickerOption(
//                                   imageTitle: 'Drum',
//                                   onTap: () {
//                                     setState(() => imageSelector = 'drum');
//                                   },
//                                   isSelected: imageSelector == 'drum',
//                                 ),
//                                 const SizedBox(width: 25),
//                                 _ImagePickerOption(
//                                   imageTitle: 'Village',
//                                   onTap: () {
//                                     setState(() => imageSelector = 'village');
//                                   },
//                                   isSelected: imageSelector == 'village',
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 40.h),
