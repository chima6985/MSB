import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({
    super.key,
  });
  static const String id = 'newGameScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Center(
                  child: Text(
                    'New Game',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      height: 1.8,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppAssets.images.jpegs.masoyinboLogo
                        .image(
                          scale: 4.5,
                        )
                        .animate(
                          onComplete: (controller) => controller.repeat(),
                        )
                        .shimmer(
                          color: AppColors.white.withValues(alpha: 0.45),
                          size: 0.9,
                          curve: Curves.slowMiddle,
                          duration: 1900.ms,
                          delay: 2.seconds,
                        ),
                    const SizedBox(height: 15),
                    Text(
                      aboutToPlayAgainWithSameSettingsYr,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: acceptGameYr,
                      onPressed: () => Navigator.popUntil(
                        context,
                        (route) =>
                            route.settings.name == DashboardIndexScreen.id,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: goHomeYr,
                      isOutlined: true,
                      labelColor: AppColors.black15,
                      onPressed: () => context.goNamed(DashboardIndexScreen.id),
                    ),
                    SizedBox(height: context.btmPadding + 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
