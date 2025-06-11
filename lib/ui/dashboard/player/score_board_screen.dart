import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class ScoreBoardScreen extends StatelessWidget {
  const ScoreBoardScreen({
    super.key,
    required this.gameCode,
  });

  final String gameCode;

  static const String id = 'scoreBoardScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayerPointsAndPositionCubit(
            authBloc: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => LeaveGameRoomCubit(
            authBloc: context.read(),
          ),
        ),
      ],
      child: _ScoreBoardScreen(gameCode: gameCode),
    );
  }
}

class _ScoreBoardScreen extends StatefulWidget {
  const _ScoreBoardScreen({
    required this.gameCode,
  });

  final String gameCode;

  @override
  State<_ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}

class _ScoreBoardScreenState extends State<_ScoreBoardScreen> {
  @override
  void initState() {
    super.initState();
    isGameStartedPolling(gameCode: widget.gameCode);
  }

  Timer? _timer;

  /// Start polling getAllPlayersEndpoint every 10 seconds
  Future<void> isGameStartedPolling({required String gameCode}) async {
    _timer?.cancel();

    await context
        .read<PlayerPointsAndPositionCubit>()
        .getPlayerPointsAndPosition(gameCode: gameCode);

    //polling is 6 secs on prod and 15 seconds on debug
    _timer = Timer.periodic(const Duration(seconds: kDebugMode ? 15 : 6), (_) {
      context
          .read<PlayerPointsAndPositionCubit>()
          .getPlayerPointsAndPosition(gameCode: gameCode);
    });
  }

  /// Stop polling
  void stopPolling() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<PlayerPointsAndPositionCubit>()
        .getPlayerPointsAndPosition(gameCode: widget.gameCode);
    final currentLocale = context.currentLocale;
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      onTap: () => Share.share('See my team topping'),
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
                Center(
                  child: Text(
                    context.appLocale.scoreboard,
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
            SizedBox(height: 35.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _ScoreboardPositionWidget(
                      image: AppAssets.images.jpegs.scoreboardPosition1.path,
                      color: AppColors.greenE7,
                      borderColor: AppColors.green62,
                    ),
                    _ScoreboardPositionWidget(
                      image: AppAssets.images.jpegs.scoreboardPosition2.path,
                      color: AppColors.lemonF6,
                      borderColor: AppColors.lemonC3,
                    ),
                    _ScoreboardPositionWidget(
                      image: AppAssets.images.jpegs.scoreboardPositoin3.path,
                      color: AppColors.greenE7,
                      borderColor: AppColors.green62.withValues(alpha: 0.4),
                    ),
                    const Spacer(),
                    const SizedBox(height: 24),
                    Button(
                      label: '',
                      onPressed: () => Navigator.popUntil(
                        context,
                        (route) => route.settings.name == GameRoomScreen.id,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: AppColors.white),
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
                    const SizedBox(height: 24),
                    Button(
                      label: '',
                      isOutlined: true,
                      labelColor: AppColors.black15,
                      onPressed: () {
                        context.read<LeaveGameRoomCubit>().leaveGameRoom();
                        context.goNamed(DashboardIndexScreen.id);
                      },
                      child: RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyMedium,
                          children: [
                            TextSpan(text: context.appLocale.goHome),
                            TextSpan(
                              text:
                                  ' (${currentLocale == yo ? context.enLocale.goHome : context.yoLocale.goHome})',
                              style: context.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w300,
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
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreboardPositionWidget extends StatelessWidget {
  const _ScoreboardPositionWidget({
    required this.image,
    required this.color,
    required this.borderColor,
  });

  final String image;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: mqr.width,
              child: Container(
                padding: const EdgeInsets.fromLTRB(19, 7, 11, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: color,
                  border: Border.all(
                    width: 0.4,
                    color: borderColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Team Name',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppAssets.images.jpegs.coin2.image(
                              width: 24.w,
                              height: 24.w,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '200',
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.goldCE,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Olamide, Pelumi, Morolayo, Tobiloba',
                            textScaler: TextScaler.noScaling,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black15.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Text(
                          '999',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: -13.5.w,
              top: -20.3.w,
              child: Image.asset(
                image,
                scale: 4.2,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
