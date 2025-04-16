import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class RanOutOfLivesScreen extends StatelessWidget {
  const RanOutOfLivesScreen({super.key});

  static const String id = 'ranOutOfLivesScreen';

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.topPadding),
              AppAssets.images.jpegs.heartBroken.image(
                scale: 2.w,
              ),
              SizedBox(height: 10.h),
              Text(
                context.appLocale.noMoreOpportunities,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.appLocale.ifYouDontSucceedThisTime,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 40.h),
              Button(
                label: '',
                onPressed: () => context.pop(),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(text: context.appLocale.playAgain),
                      TextSpan(
                        text:
                            ' (${currentLocale == yo ? context.enLocale.playAgain : context.yoLocale.playAgain})',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Button(
                label: '',
                isOutlined: true,
                labelColor: AppColors.black15,
                onPressed: () => Navigator.popUntil(
                  context,
                  (route) => route.settings.name == DashboardIndexScreen.id,
                ),
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.black15,
                    ),
                    children: [
                      TextSpan(text: context.appLocale.backToHome),
                      TextSpan(
                        text:
                            ' (${currentLocale == yo ? context.enLocale.backToHome : context.yoLocale.backToHome})',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.black15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.btmPadding + 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
