import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class StartGameModal extends HookWidget {
  const StartGameModal({
    super.key,
    required this.gameCode,
  });

  final String gameCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return BlocListener<StartGameCubit, StartGameState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            context
              ..pop()
              ..pushNamed(
                QuizLoaderScreen.id,
              );
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(Iconsax.close_circle),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              context.appLocale.attention,
              textAlign: TextAlign.center,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.margarine,
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                context.appLocale.startingGameClosesDoorForSinglePlayer,
                textAlign: TextAlign.center,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.8.h,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                context.appLocale.startGameOnlyWhenYouHaveAllPlayersIn,
                textAlign: TextAlign.center,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: AppColors.yellowFF,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Button(
              label: context.appLocale.yesStartPlaying,
              isLoading: isLoading.value,
              onPressed: () =>
                  context.read<StartGameCubit>().startGame(gameCode: gameCode),
            ),
            const SizedBox(height: 24),
            Button(
              label: context.appLocale.goBackToRoom,
              isOutlined: true,
              labelColor: AppColors.black15,
              onPressed: () => context.pop(context),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
