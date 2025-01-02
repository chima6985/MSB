import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String id = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    // final _dbProvider = DBProvider();

    /// Function to navigate to the next screen after the splash screen is completed
    void navigate() {
      context.goNamed(OnboardingScreen.id);
      // _dbProvider.storeBoolInSharedPreference(isLoggedIn, false);
      // bool isPartiallyOnboarded =
      //     _dbProvider.getBoolInSharedPreference(onboardedUserKey);
      // if (isPartiallyOnboarded) {
      //   if (!mounted) return;
      //   context.goNamed(Login.id);
      // } else {
      //   if (!mounted) return;
      //   context.goNamed(Onboarding.id);
      // }
    }

    return Scaffold(
      body: DecoratedContainer(
        child: Stack(
          children: [
            Hero(
              tag: 'masoyinbo_logo',
              child: Center(
                child: AppAssets.images.jpegs.masoyinboLogo
                    .image(
                      scale: 4.5,
                    )
                    .animate(
                      onComplete: (controller) => navigate(),
                    )
                    .shimmer(
                      color: AppColors.white.withValues(alpha: 0.45),
                      size: 0.9,
                      curve: Curves.slowMiddle,
                      duration: 1900.ms,
                    )
                    .callback(
                      callback: (_) {},
                    ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppAssets.images.jpegs.yorubaGroupAvatar.image(),
            ),
          ],
        ),
      ),
    );
  }
}
