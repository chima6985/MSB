import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class DashboardIndexScreen extends HookWidget {
  const DashboardIndexScreen({
    super.key,
    this.initialIndex = 0,
    this.isInitialLoad = false,
  });
  static const String id = 'dashboardIndexScreen';

  final int initialIndex;
  final bool isInitialLoad;

  @override
  Widget build(BuildContext context) {
    final currentPosition = useState(initialIndex);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: currentPosition.value == 3
          ? AppBar(
              title: Text(
                'Me',
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () => context.pushNamed(BookmarkScreen.id),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  splashColor: AppColors.black15.withValues(alpha: 0.1),
                  highlightColor: AppColors.black15.withValues(alpha: 0.1),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Icon(
                      Iconsax.save_2,
                      color: AppColors.black15,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: InkWell(
                    onTap: () => context.pushNamed(SettingsScreen.id),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    splashColor: AppColors.black15.withValues(alpha: 0.1),
                    highlightColor: AppColors.black15.withValues(alpha: 0.1),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: Icon(
                        Iconsax.setting_2,
                        color: AppColors.black15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      body: DecoratedContainer(
        child: Stack(
          children: [
            if (currentPosition.value == 0) const Home(),
            if (currentPosition.value == 1) const LearnScreen(),
            if (currentPosition.value == 2)
              LeaderBoard(currentPosition: currentPosition),
            if (currentPosition.value == 3) const MeScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.15),
                        blurRadius: 11,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.fromLTRB(23.w, 16, 23.w, context.btmPadding),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blueE7,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomNavButton(
                          buttonName: context.appLocale.home,
                          buttonIcon: AppAssets.images.svgs.home.path,
                          buttonIconBold: AppAssets.images.svgs.homeBold.path,
                          currentPosition: currentPosition.value,
                          onPressed: () {
                            if (0 != currentPosition.value) {
                              currentPosition.value = 0;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                        BottomNavButton(
                          buttonName: context.appLocale.learn,
                          buttonIcon: AppAssets.images.svgs.learn.path,
                          buttonIconBold: AppAssets.images.svgs.learnBold.path,
                          position: 1,
                          currentPosition: currentPosition.value,
                          onPressed: () {
                            if (1 != currentPosition.value) {
                              currentPosition.value = 1;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                        BottomNavButton(
                          buttonName: context.appLocale.leaderboard,
                          buttonIcon: AppAssets.images.svgs.leaderBoard.path,
                          buttonIconBold:
                              AppAssets.images.svgs.leaderBoardBold.path,
                          position: 2,
                          currentPosition: currentPosition.value,
                          onPressed: () {
                            if (2 != currentPosition.value) {
                              currentPosition.value = 2;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                        BottomNavButton(
                          buttonName: context.appLocale.me,
                          buttonIcon: AppAssets.images.svgs.me.path,
                          buttonIconBold: AppAssets.images.svgs.meBold.path,
                          position: 3,
                          currentPosition: currentPosition.value,
                          onPressed: () {
                            if (3 != currentPosition.value) {
                              currentPosition.value = 3;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
