import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String id = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    /// Function to navigate to the next screen after the splash screen is completed
    void navigate() {
      final email = AppStorage.getEmail();
      final user = AppStorage.getUser();
      if (user != null) {
        context.goNamed(DashboardIndexScreen.id);
      } else {
        if (email != null) {
          context.goNamed(LoginScreen.id);
        } else {
          context.goNamed(OnboardingScreen.id);
        }
      }
    }

    context.read<LocaleBloc>().add(
          const LocaleEvent.initialLocale(),
        );

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
