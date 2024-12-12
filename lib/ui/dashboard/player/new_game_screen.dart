import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({
    super.key,
    this.isPlayAgainWithSameSettings = false,
  });
  static const String id = 'newGameScreen';

  final bool isPlayAgainWithSameSettings;

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
                          color: AppColors.white.withOpacity(0.45),
                          size: 0.9,
                          curve: Curves.slowMiddle,
                          duration: 1900.ms,
                          delay: 2.seconds,
                        ),
                    const SizedBox(height: 15),
                    if (isPlayAgainWithSameSettings)
                      Text(
                        aboutToPlayAgainWithSameSettingsYr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      )
                    else
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: context.textTheme.bodyMedium,
                          children: [
                            const TextSpan(text: aboutToPlayAgainWithSameCode),
                            TextSpan(
                              text: ' VV9645',
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    const SizedBox(height: 24),
                    Button(
                      label: acceptGameYr,
                      onPressed: () {
                        if (isPlayAgainWithSameSettings) {
                          context.pushNamed(TeamAllSetScreen.id);
                        } else {
                          context.pushNamed(GameRoomScreen.id);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: goHomeYr,
                      isOutlined: true,
                      labelColor: AppColors.black15,
                      onPressed: () => Navigator.popUntil(
                        context,
                        (route) =>
                            route.settings.name == DashboardIndexScreen.id,
                      ),
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
