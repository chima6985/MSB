import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:masoyinbo_mobile/core/models/question_model.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.currentQuestionIndex,
    required this.totalNoOfQuestions,
    required this.isPracticeMode,
    required this.isSinglePlayerMode,
    required this.totalLives,
    required this.livesRemaining,
    required this.currentAltQuestionText,
    required this.currentQuestionText,
    this.audioPath,
    this.suffix,
    this.onFlipPressed,
    required this.audioPlayer,
  });

  final int currentQuestionIndex;
  final int totalNoOfQuestions;
  final bool isPracticeMode;
  final bool isSinglePlayerMode;
  final int? totalLives;
  final int livesRemaining;
  final String currentAltQuestionText;
  final String currentQuestionText;
  final String? audioPath;
  final String? suffix;
  final VoidCallback? onFlipPressed;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.greyDB,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 10,
                  percent: (currentQuestionIndex + 1) / totalNoOfQuestions,
                  progressColor: AppColors.blue12,
                  backgroundColor: AppColors.greyDB,
                  animation: true,
                  animateFromLastPercent: true,
                  barRadius: const Radius.circular(12),
                ),
              ),
              if ((isPracticeMode == true || isSinglePlayerMode == true) &&
                  totalLives != null) ...[
                SizedBox(width: 15.w),
                GameLivesWidget(
                  totalLives: totalLives ?? 0,
                  livesRemaining: livesRemaining,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentLocale == yo
                      ? currentAltQuestionText
                      : currentQuestionText,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentLocale == yo
                      ? currentQuestionText
                      : currentAltQuestionText,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 30.h),
                if (suffix != null && (suffix?.isNotEmpty ?? false))
                  Text(
                    suffix ?? '',
                    textAlign: TextAlign.start,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                SizedBox(height: 40.h),
                Row(
                  children: [
                    if (audioPath == null || (audioPath?.isEmpty ?? true))
                      AudioButton(
                        audioPath: '',
                        bgAudioPlayer: audioPlayer,
                      )
                    else
                      AudioButton(
                        audioPath: audioPath ?? '',
                        bgAudioPlayer: audioPlayer,
                      ),
                    const SizedBox(width: 24),
                    ActionButton(
                      label: 'Speak',
                      isEnabled: true,
                      icon: Icon(
                        Iconsax.microphone_2,
                        size: 17.sp,
                        color: AppColors.black15,
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (context, stateSetter) {
                        return ActionButton(
                          label: 'Flip',
                          isEnabled: isPracticeMode,
                          icon: Icon(
                            Icons.swipe_right_rounded,
                            size: 17.sp,
                            color: AppColors.black15,
                          ),
                          onTap: onFlipPressed?.call,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlippedQuestionCard extends StatelessWidget {
  const FlippedQuestionCard({
    super.key,
    required this.currentQuestionIndex,
    required this.totalNoOfQuestions,
    required this.isPracticeMode,
    this.audioPath,
    this.suffix,
    required this.answer,
    required this.audioPlayer,
  });

  final int currentQuestionIndex;
  final int totalNoOfQuestions;
  final bool isPracticeMode;
  final String? audioPath;
  final String? suffix;
  final List<AnswerFormat>? answer;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final correctAnswer =
        (answer != null) ? answer?.first.answer.value?.capitalize() ?? '' : '';
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        color: AppColors.greyDB,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 10,
            percent: (currentQuestionIndex + 1) / totalNoOfQuestions,
            progressColor: AppColors.blue12,
            backgroundColor: AppColors.blueE7,
            animation: true,
            animateFromLastPercent: true,
            barRadius: const Radius.circular(12),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.appLocale.responseToTheQuestionIs,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentLocale == yo
                      ? context.enLocale.responseToTheQuestionIs
                      : context.yoLocale.responseToTheQuestionIs,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  correctAnswer,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  children: [
                    if (audioPath == null || (audioPath?.isEmpty ?? true))
                      AudioButton(
                        audioPath: '',
                        bgAudioPlayer: audioPlayer,
                      )
                    else
                      AudioButton(
                        audioPath: audioPath ?? '',
                        bgAudioPlayer: audioPlayer,
                      ),
                    const SizedBox(width: 24),
                    ActionButton(
                      label: 'Speak',
                      isEnabled: false,
                      icon: Icon(
                        Iconsax.microphone_2,
                        size: 17.sp,
                        color: AppColors.black15,
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (context, stateSetter) {
                        return ActionButton(
                          label: 'Flip',
                          isEnabled: false,
                          icon: Icon(
                            Icons.swipe_right_rounded,
                            size: 17.sp,
                            color: AppColors.black15,
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AudioButton extends StatefulWidget {
  const AudioButton({
    super.key,
    required this.audioPath,
    required this.bgAudioPlayer,
  });

  final String audioPath;
  final AudioPlayer bgAudioPlayer;

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  final player = AudioPlayer();
  bool isFetchedAudio = false;
  bool playing = false;

  Future<void> fetchAudio() async {
    try {
      setState(() => playing = true);
      await player.setUrl(widget.audioPath);
      await player.setLoopMode(LoopMode.off);
      await player.setVolume(0.55);
      setState(() => isFetchedAudio = true);
      await playAudio();
    } catch (_) {}
  }

  Future<void> playAudio() async {
    setState(() => playing = true);
    await widget.bgAudioPlayer.pause();
    await player.seek(Duration.zero);
    await player.play().then((_) {
      setState(() => playing = false);
    });
    await widget.bgAudioPlayer.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: playing,
      child: ActionButton(
        label: 'Listen',
        isEnabled: widget.audioPath.isNotEmpty,
        icon: playing
            ? const FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: CustomSpinner(
                    color: AppColors.blue13,
                  ),
                ),
              )
            : Transform.scale(
                scale: 0.7,
                child: AppAssets.images.svgs.listen.svg(),
              ),
        onTap: () async {
          if (!isFetchedAudio) {
            await fetchAudio();
          } else {
            await playAudio();
          }
        },
      ),
    );
  }
}
