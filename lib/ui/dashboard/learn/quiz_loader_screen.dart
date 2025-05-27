import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class QuizLoaderScreen extends HookWidget {
  const QuizLoaderScreen({
    super.key,
    this.gameCode,
    this.isGameMaster,
    this.isMultiPlayer,
    this.isTeamLeader,
    this.isTeamMode,
  });

  final String? gameCode;
  final bool? isGameMaster;
  final bool? isMultiPlayer;
  final bool? isTeamLeader;
  final bool? isTeamMode;

  static const String id = 'quizLoaderScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;

    useEffect(
      () {
        // For multiplayer games, fetch questions using the game code.
        if (gameCode != null && isMultiPlayer == true) {
          context.read<GetQuestionCubit>().getMultiPlayerQuestion(
                gameCode: gameCode ?? '',
              );
        }
        return null;
      },
      [],
    );

    return BlocListener<GetQuestionCubit, GetQuestionState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (questions, _) {
            context.pushReplacementNamed(
              PlayQuestionScreen.id,
              extra: {
                'isTimed': false,
                'isTeamLeader': isTeamLeader,
                'isMultiPlayer': isMultiPlayer,
                'isGameMaster': isGameMaster,
                'isTeamMode': isTeamMode,
              },
            );
          },
          error: (error) {
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
            context.pop();
          },
          orElse: () {},
        );
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            width: mqr.width,
            height: mqr.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AppAssets.images.jpegs.darkDecoratedBg.provider(),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<GetQuestionCubit>().getMultiPlayerQuestion(
                          gameCode: gameCode ?? '',
                        );
                  },
                  child: AppAssets.images.jpegs.masoyinboLogo
                      .image(
                        width: 85.w,
                        height: 85.w,
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                        delay: 1.seconds,
                      )
                      .scale(
                        duration: 1.65.seconds,
                        begin: const Offset(1.1, 1.1),
                        end: const Offset(0.9, 0.9),
                        curve: Curves.easeInCubic,
                      ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.appLocale.loadingYourQuiz,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: AppColors.white,
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 1.6.sp),
                      child: const TypeWriterProgressTextIndicator(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  context.appLocale.pleaseWaitForQuestions,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
