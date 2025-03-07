import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class DeleteAccountScreen extends HookWidget {
  const DeleteAccountScreen({
    super.key,
  });
  static const String id = 'deleteAccountScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final yo = context.yoLocale;
    final en = context.enLocale;
    return Scaffold(
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
                    child: Text(
                      deleteAccountEn,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sureToDeleteAccountYr,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    whatHappensWhenYouDeleteYr,
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    learningProgressDeleteAccountEn,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    profileAndSettingsEn,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    actionCannotBeUndoneEn,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        const TextSpan(text: ifYouAreCertainEn),
                        TextSpan(
                          text: ' masoyinbo@eayoruba.com ',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.blue0F,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const TextSpan(text: ifYouHaveQuestionsEn),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Button(
              label: currentLocale == 'yr' ? yo.confirm : en.confirm,
              width: mqr.width * 0.83,
              onPressed: () => context.pushNamed(DeleteAccountSurveyScreen.id),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
