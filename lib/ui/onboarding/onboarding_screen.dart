import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String id = 'onboardingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.topPadding),
                  Hero(
                    tag: 'masoyinbo_logo',
                    child: AppAssets.images.jpegs.masoyinboLogo.image(
                      width: 94.w,
                      height: 94.w,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    getAwayYr,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: 'Margarine',
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      getAwayEn,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () => context.goNamed(LanguagePreferenceScreen.id),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blue12,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            onboardingStartYr,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 9),
                          Icon(
                            Iconsax.arrow_right_1,
                            color: AppColors.white,
                            size: 19.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppAssets.images.jpegs.onboardingCircles.image(),
            ),
          ],
        ),
      ),
    );
  }
}
