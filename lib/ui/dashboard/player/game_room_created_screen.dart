import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:share_plus/share_plus.dart';

class GameRoomCreatedScreen extends StatelessWidget {
  const GameRoomCreatedScreen({
    super.key,
    this.isTeamMode = false,
    this.isTeamFormationAutomatic = false,
  });
  static const String id = 'gameRoomCreatedScreen';

  final bool isTeamMode;
  final bool isTeamFormationAutomatic;

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
                    gameRoomCreatedEn,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      height: 1.8,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppAssets.images.jpegs.masoyinboLogo
                        .image(
                          scale: 4,
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
                    Text(
                      inviteFriendsToYourGameYr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'VV9645',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      isYourGameCodeYr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 24),
                    Button(
                      label: shareGameYr,
                      onPressed: () => Share.share('Join my team with VV9645'),
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: goToGameRoomYr,
                      isOutlined: true,
                      labelColor: AppColors.black15,
                      onPressed: () => context.pushNamed(
                        GameRoomScreen.id,
                        extra: {
                          'isMultiplayer': true,
                          'isTeamMode': isTeamMode,
                          'isTeamFormationAutomatic': isTeamFormationAutomatic,
                        },
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
