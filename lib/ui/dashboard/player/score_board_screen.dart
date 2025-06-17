import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/core/models/player_position_model.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ScoreBoardScreen extends StatelessWidget {
  const ScoreBoardScreen({
    super.key,
    required this.gameCode,
    required this.isGameMaster,
  });

  final String gameCode;
  final bool isGameMaster;

  static const String id = 'scoreBoardScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartGameCubit(
            authBloc: context.read(),
          ),
        ),
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
      child: _ScoreBoardScreen(
        gameCode: gameCode,
        isGameMaster: isGameMaster,
      ),
    );
  }
}

class _ScoreBoardScreen extends StatefulWidget {
  const _ScoreBoardScreen({
    required this.gameCode,
    required this.isGameMaster,
  });

  final String gameCode;
  final bool isGameMaster;

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
  bool isPlayingAgain = false;

  /// Start polling getAllPlayersEndpoint every 10 seconds
  Future<void> isGameStartedPolling({required String gameCode}) async {
    _timer?.cancel();

    await context
        .read<PlayerPointsAndPositionCubit>()
        .getPlayerPointsAndPosition(gameCode: gameCode);

    //polling is 5 secs on prod and 15 seconds on debug
    _timer = Timer.periodic(const Duration(seconds: kDebugMode ? 15 : 5), (_) {
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
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final isLoading =
        context.watch<PlayerPointsAndPositionCubit>().state.maybeMap(
              loading: (_) => true,
              orElse: () => false,
            );
    return BlocListener<StartGameCubit, StartGameState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => setState(() {
            isPlayingAgain = true;
          }),
          loaded: () {
            setState(() {
              isPlayingAgain = false;
            });
            Navigator.popUntil(
              context,
              (route) => route.settings.name == GameRoomScreen.id,
            );
          },
          error: (error) {
            setState(() {
              isPlayingAgain = false;
            });
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => setState(() {
            isPlayingAgain = false;
          }),
        );
      },
      child: Scaffold(
        body: DecoratedContainer(
          child: Column(
            children: [
              SizedBox(height: context.topPadding),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: isLoading
                        ? GestureDetector(
                            onTap: () {
                              context
                                  .read<PlayerPointsAndPositionCubit>()
                                  .getPlayerPointsAndPosition(
                                    gameCode: widget.gameCode,
                                  );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.cached,
                              )
                                  .animate(
                                    onPlay: (controller) => controller.repeat(),
                                  )
                                  .rotate(
                                    duration: 800.ms,
                                    curve: Curves.easeInOut,
                                  ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.cached,
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
                child: BlocBuilder<PlayerPointsAndPositionCubit,
                    PlayerPointsAndPositionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      error: (players, error) {
                        return (players != null && players.isNotEmpty)
                            ? _ScoreboardList(players: players)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
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
                                        .read<PlayerPointsAndPositionCubit>()
                                        .getPlayerPointsAndPosition(
                                          gameCode: widget.gameCode,
                                        ),
                                  ),
                                ],
                              );
                      },
                      loading: (players) =>
                          (players != null && players.isNotEmpty)
                              ? _ScoreboardList(players: players)
                              : const Center(
                                  child: CustomSpinner(color: AppColors.black),
                                ),
                      orElse: SizedBox.new,
                      loaded: (players) {
                        return _ScoreboardList(players: players);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      label: '',
                      onPressed: () {
                        if (isPlayingAgain) return;
                        if (widget.isGameMaster) {
                          context.read<StartGameCubit>().stopGame(
                                gameCode: widget.gameCode,
                              );
                        } else {
                          Navigator.popUntil(
                            context,
                            (route) => route.settings.name == GameRoomScreen.id,
                          );
                        }
                      },
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
                  ],
                ),
              ),
              SizedBox(height: context.btmPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreboardList extends StatelessWidget {
  const _ScoreboardList({
    required this.players,
  });

  final List<PlayerPosition> players;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(21, 16, 21, 0),
        child: Column(
          children: players
              .map(
                (player) => _ScoreboardPositionWidget(
                  player: player,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ScoreboardPositionWidget extends StatelessWidget {
  const _ScoreboardPositionWidget({
    required this.player,
  });

  final PlayerPosition player;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;

    final image = {
      1: AppAssets.images.jpegs.scoreboardPosition1.path,
      2: AppAssets.images.jpegs.scoreboardPosition2.path,
      3: AppAssets.images.jpegs.scoreboardPositoin3.path,
    };

    final color = {
      1: AppColors.greenE7,
      2: AppColors.lemonF6,
      3: AppColors.greenE7,
    };

    final borderColor = {
      1: AppColors.green62,
      2: AppColors.lemonC3,
      3: AppColors.green62.withValues(alpha: 0.4),
    };

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
                  color: color[player.position] ?? AppColors.greenE7,
                  border: Border.all(
                    width: 0.4,
                    color: borderColor[player.position] ?? AppColors.green62,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          player.username,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Visibility(
                        //   visible: false,
                        //   child: Flexible(
                        //     child: Text(
                        //       'Olamide, Pelumi, Morolayo, Tobiloba',
                        //       textScaler: TextScaler.noScaling,
                        //       maxLines: 1,
                        //       overflow: TextOverflow.ellipsis,
                        //       style: context.textTheme.bodySmall!.copyWith(
                        //         fontStyle: FontStyle.italic,
                        //         fontWeight: FontWeight.w300,
                        //         color: AppColors.black15.withValues(alpha: 0.7),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppAssets.images.jpegs.coin2.image(
                              width: 24.w,
                              height: 24.w,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              player.coins.toString(),
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.goldCE,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 25.w),
                        Text(
                          player.points.toString(),
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
            if ([1, 2, 3].contains(player.position))
              Positioned(
                left: -13.5.w,
                top: -20.3.w,
                child: Image.asset(
                  image[player.position] ?? '',
                  scale: 4.2,
                ),
              )
            else
              Positioned(
                top: -10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueE7,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.4,
                      color: AppColors.greyDB,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    child: Text(
                      player.position.toString(),
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue12,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
