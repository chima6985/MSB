import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SetAvatarModal extends StatelessWidget {
  const SetAvatarModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        AppAssets.images.jpegs.selectAvatar.image(
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              Text(
                letsGetYouAnAvatarYr,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                addSomeTouchOfPersonalityYr,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 32),
              Button(
                label: '',
                onPressed: () => context.pushNamed(ChangeAvatarScreen.id),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                    children: [
                      const TextSpan(text: setAvatarYr),
                      TextSpan(
                        text: ' ($setAvatarEn)',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Button(
                label: '',
                isOutlined: true,
                labelColor: AppColors.black15,
                onPressed: () {
                  context.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const DailyReminderModal(),
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: iWillDoThisLaterYr),
                      TextSpan(
                        text: ' ($iWillDoThisLaterEn)',
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.btmPadding),
      ],
    );
  }
}
