import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class PlayerGameAnalyticsScreen extends StatelessWidget {
  const PlayerGameAnalyticsScreen({super.key});

  static const String id = 'playerGameAnalyticsScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerRewardsCubit(
        authBloc: context.read(),
      ),
      child: const _PlayerGameAnalyticsScreen(),
    );
  }
}

class _PlayerGameAnalyticsScreen extends HookWidget {
  const _PlayerGameAnalyticsScreen();

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;

    useEffect(
      () {
        context.read<PlayerRewardsCubit>().getPlayerRewards();
        return null;
      },
      [],
    );

    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () => Share.share('See my team topping on Masoyinbo'),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  splashColor: AppColors.black15.withValues(alpha: 0.1),
                  highlightColor: AppColors.black15.withValues(alpha: 0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 6,
                    ),
                    child: AppAssets.images.svgs.share.svg(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  children: [
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
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Spacer(),
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
                        (route) =>
                            route.settings.name == DashboardIndexScreen.id,
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
                  ],
                ),
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
