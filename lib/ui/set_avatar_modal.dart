import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class SetAvatarModal extends StatelessWidget {
  const SetAvatarModal({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
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
                context.appLocale.letsGetYouAnAvatar,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.appLocale.addSomeTouchOfPersonality,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 32),
              Button(
                label: '',
                onPressed: () =>
                    context.pushNamed(ChangeAvatarScreen.id).then((value) {
                  if (value != null && value == true) {
                    if (!context.mounted) return;
                    context.pop(context);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const ChooseMutliPlayerModeModal(),
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    );
                  }
                }),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(text: context.appLocale.setAvatar),
                      TextSpan(
                        text:
                            ' (${currentLocale == yo ? context.enLocale.setAvatar : context.yoLocale.setAvatar})',
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
                    builder: (context) => const ChooseMutliPlayerModeModal(),
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
                      TextSpan(text: context.appLocale.iWillDoThisLater),
                      TextSpan(
                        text:
                            ' (${currentLocale == yo ? context.enLocale.iWillDoThisLater : context.yoLocale.iWillDoThisLater})',
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
