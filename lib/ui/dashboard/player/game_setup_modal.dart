import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class GameSetupModal extends HookWidget {
  const GameSetupModal({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return BlocListener<JoinGameRoomCubit, JoinGameRoomState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            context
              ..pop(context)
              ..pushNamed(GameRoomScreen.id);
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
              gameSetupYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.margarine,
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      gamePreparedByFriendYr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const _GameModeTextFieldWidget(
                      titleField: gameCategoryYr,
                      text: 'Proverbs',
                    ),
                    const _GameModeTextFieldWidget(
                      titleField: gameDifficultyYr,
                      text: 'Hard',
                    ),
                    const _GameModeTextFieldWidget(
                      titleField: teamModeYr,
                      text: 'On',
                    ),
                  ],
                ),
              ),
            ),
            Button(
              label: enterGameRoomYr,
              onPressed: () => context
                ..pop(context)
                ..pushNamed(GameRoomScreen.id),
            ),
            const SizedBox(height: 24),
            Button(
              label: leaveYr,
              isOutlined: true,
              labelColor: AppColors.black15,
              onPressed: () => context..pop(context),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _GameModeTextFieldWidget extends StatelessWidget {
  const _GameModeTextFieldWidget({
    required this.titleField,
    required this.text,
  });

  final String titleField;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleField,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
