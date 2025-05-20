import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class GameRoomCreatedScreen extends HookWidget {
  const GameRoomCreatedScreen({
    super.key,
    required this.gameCode,
    this.isTeamMode,
    this.isTeamFormationAutomatic,
  });

  static const String id = 'gameRoomCreatedScreen';

  final String gameCode;
  final bool? isTeamMode;
  final bool? isTeamFormationAutomatic;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
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
                    context.appLocale.gameRoomCreated,
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
                          color: AppColors.white.withValues(alpha: 0.45),
                          size: 0.9,
                          curve: Curves.slowMiddle,
                          duration: 1900.ms,
                          delay: 2.seconds,
                        ),
                    const SizedBox(height: 15),
                    Text(
                      context.appLocale.inviteFriendsToYourGame,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () =>
                          Functions.copyTextToClipBoard(context, gameCode),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                gameCode,
                                textAlign: TextAlign.center,
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Iconsax.copy,
                                size: 17.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      context.appLocale.isYourGameCode,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 24),
                    Button(
                      label: context.appLocale.shareGame,
                      onPressed: () => Share.share(
                        context.appLocale.joinMyGameRoomOnMsb(gameCode),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: context.appLocale.goToGameRoom,
                      isOutlined: true,
                      isLoading: isLoading.value,
                      labelColor: AppColors.black15,
                      loadingIndicatorColor: AppColors.blue12,
                      onPressed: () => context.pushNamed(
                        GameRoomScreen.id,
                        extra: {
                          'gameCode': gameCode,
                          'isGameMaster': true,
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
