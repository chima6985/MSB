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
    final mqr = MediaQuery.of(context).size;
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
            Expanded(
              child: BlocBuilder<PlayerRewardsCubit, PlayerRewardsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    error: (error) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            error ?? '',
                            textScaler: TextScaler.noScaling,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Button(
                          width: mqr.width * 0.4,
                          label: context.appLocale.retry,
                          onPressed: () => context
                              .read<PlayerRewardsCubit>()
                              .getPlayerRewards(),
                        ),
                      ],
                    ),
                    loading: () => const Center(
                      child: CustomSpinner(color: AppColors.black),
                    ),
                    orElse: SizedBox.new,
                    loaded: (playerStat) {
                      final isGoodPerformance = playerStat.accuracy >= 50;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () => Share.share(
                                  'See my performance on Masoyinbo',
                                ),
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                splashColor:
                                    AppColors.black15.withValues(alpha: 0.1),
                                highlightColor:
                                    AppColors.black15.withValues(alpha: 0.1),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 6,
                                  ),
                                  child: AppAssets.images.svgs.share.svg(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (isGoodPerformance)
                              AppAssets.images.jpegs.happyEmoji.image(
                                scale: 2.w,
                              )
                            else
                              AppAssets.images.jpegs.sadEmoji.image(
                                scale: 2.w,
                              ),
                            SizedBox(height: 20.h),
                            Text(
                              isGoodPerformance
                                  ? context.appLocale.welldone
                                  : context.appLocale.gameOver,
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.titleLarge!.copyWith(
                                fontFamily: FontFamily.margarine,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              isGoodPerformance
                                  ? context.appLocale.proudOfYourProgress
                                  : context.appLocale.dontGiveUp,
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 28.h),
                            _AnalyticsWidget(
                              icon: AppAssets.images.jpegs.coin2.image(
                                width: 32.w,
                                height: 32.w,
                              ),
                              title: context.appLocale.coinsEarned,
                              value: playerStat.coins.toString(),
                            ),
                            const SizedBox(height: 8),
                            _AnalyticsWidget(
                              icon: AppAssets.images.svgs.accuracy.svg(),
                              title: context.appLocale.accuracy,
                              value: '${playerStat.accuracy}%',
                            ),
                            const SizedBox(height: 8),
                            _AnalyticsWidget(
                              icon: AppAssets.images.svgs.hourGlass.svg(),
                              title: context.appLocale.timeSpent,
                              value: playerStat.timeSpent.isEmpty
                                  ? '- : -'
                                  : playerStat.timeSpent,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(
                children: [
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
                ],
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsWidget extends StatelessWidget {
  const _AnalyticsWidget({
    required this.icon,
    required this.title,
    required this.value,
  });

  final Widget icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.greyB6,
          width: 0.6,
        ),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            title,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.grey95,
            ),
          ),
          const Spacer(),
          Text(
            value,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
