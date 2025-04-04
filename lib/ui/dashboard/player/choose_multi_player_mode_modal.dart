import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ChooseMutliPlayerModeModal extends StatelessWidget {
  const ChooseMutliPlayerModeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          AppAssets.images.jpegs.multiplePlayer.image(
            scale: 3,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              context.appLocale.multiPlayer,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.margarine,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              chooseAnExistingGameYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Button(
            label: '',
            onPressed: () => context
              ..pop(context)
              ..pushNamed(
                PlayerScreen.id,
                extra: {'isMultiPlayer': true},
              ),
            child: RichText(
              text: TextSpan(
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                ),
                children: [
                  const TextSpan(text: createGameYr),
                  TextSpan(
                    text: ' ($createGameEn)',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Button(
            label: '',
            isOutlined: true,
            labelColor: AppColors.black15,
            onPressed: () => context
              ..pop(context)
              ..pushNamed(
                JoinGameByCodeScreen.id,
              ),
            child: RichText(
              text: TextSpan(
                style: context.textTheme.bodyMedium,
                children: [
                  const TextSpan(text: joinGameYr),
                  TextSpan(
                    text: ' ($joinGameEn)',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
