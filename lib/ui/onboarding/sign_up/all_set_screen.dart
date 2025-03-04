import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});
  static const String id = 'allSetScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        isAnimate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.topPadding,
            ),
            Hero(
              tag: 'masoyinbo_logo',
              child: AppAssets.images.jpegs.masoyinboLogo.image(scale: 3.8),
            ),
            SizedBox(height: mqr.height * 0.03),
            Text(
              context.appLocale.letsGo,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge!.copyWith(
                fontFamily: FontFamily.margarine,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                context.appLocale.allSetExplanation,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(height: 60.h),
            Button(
              label: '',
              onPressed: () => context.goNamed(SurveyScreen.id),
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(text: context.appLocale.continueTx),
                    TextSpan(
                      text: ' (${context.appLocale.continueTx})',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.btmPadding + 38.h),
          ],
        ),
      ),
    );
  }
}
