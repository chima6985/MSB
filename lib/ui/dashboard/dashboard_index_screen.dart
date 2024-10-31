import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
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
      body: DecoratedContainer(
        child: Stack(
          children: [
            // if (currentPosition.value == 0)
            //   Home(currentPosition: currentPosition),
            // if (currentPosition.value == 1) const Assets(),
            // if (currentPosition.value == 2) const VirtualCards(),
            // if (currentPosition.value == 3) const SettingsScreen(),
            // if (isAction.value) const BlurOverlay(),
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.15),
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
                          buttonName: homeEn,
                          buttonIcon: Iconsax.home_1,
                          buttonIconBold: Iconsax.home5,
                          currentPosition: currentPosition.value,
                          onPressed: () {
                            if (0 != currentPosition.value) {
                              currentPosition.value = 0;
                              HapticFeedback.lightImpact();
                            }
                          },
                        ),
                        BottomNavButton(
                          buttonName: leaderboardEn,
                          buttonIcon: Iconsax.ranking_14,
                          buttonIconBold: Iconsax.ranking_15,
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
                          buttonName: lessonsEn,
                          buttonIcon: Iconsax.book,
                          buttonIconBold: Iconsax.book5,
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
                          buttonName: meEn,
                          buttonIcon: Iconsax.profile_circle,
                          buttonIconBold: Iconsax.profile_circle5,
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
