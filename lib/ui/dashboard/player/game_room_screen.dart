import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/dashboard/player/team_all_set_modal.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class GameRoomScreen extends StatelessWidget {
  const GameRoomScreen({
    super.key,
    required this.gameCode,
    this.isGameMaster = false,
    this.isTeamMode,
    this.isTeamFormationAutomatic,
  });

  final String gameCode;
  final bool isGameMaster;
  final bool? isTeamMode;
  final bool? isTeamFormationAutomatic;

  static const String id = 'gameRoomScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ModifyGameRoomCubit(
            authBloc: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => AllPlayersCubit(
            authBloc: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => IsGameStartedCubit(
            authBloc: context.read(),
          ),
        ),
      ],
      child: _GameRoomScreen(
        gameCode: gameCode,
        isGameMaster: isGameMaster,
        isTeamMode: isTeamMode,
        isTeamFormationAutomatic: isTeamFormationAutomatic,
      ),
    );
  }
}

class _GameRoomScreen extends StatefulWidget {
  const _GameRoomScreen({
    required this.gameCode,
    required this.isGameMaster,
    this.isTeamMode,
    this.isTeamFormationAutomatic,
  });

  final String gameCode;
  final bool isGameMaster;
  final bool? isTeamMode;
  final bool? isTeamFormationAutomatic;

  @override
  State<_GameRoomScreen> createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<_GameRoomScreen> {
  bool isRefreshingPlayers = false;
  bool isStartingGame = false;

  bool? isNewTeamMode;
  bool? isNewTeamFormationAutomatic;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        isNewTeamMode = widget.isTeamMode;
        isNewTeamFormationAutomatic = widget.isTeamFormationAutomatic;
      },
    );
    startPlayerPolling(gameCode: widget.gameCode);
    if (!widget.isGameMaster) {
      isGameStartedPolling(gameCode: widget.gameCode);
    }
  }

  Timer? _timer;

  /// Start polling getAllPlayersEndpoint every 10 seconds
  Future<void> startPlayerPolling({required String gameCode}) async {
    _timer?.cancel();

    await context.read<AllPlayersCubit>().getAllPlayers(gameCode: gameCode);

    // Game master ? => polling is 10 secs on prod and 20 seconds on debug
    // Invitee ? => polling is 15 secs on prod and 20 seconds on debug
    _timer = Timer.periodic(
        Duration(
          seconds: kDebugMode ? 20 : (widget.isGameMaster ? 10 : 15),
        ), (_) {
      if (router.state.uri.path.replaceAll('/', '') == GameRoomScreen.id) {
        context.read<AllPlayersCubit>().getAllPlayers(gameCode: gameCode);
      }
    });
  }

  Timer? _gameStartTimer;

  /// Start polling getAllPlayersEndpoint every 10 seconds
  Future<void> isGameStartedPolling({required String gameCode}) async {
    _gameStartTimer?.cancel();

    await context.read<IsGameStartedCubit>().isGameStarted(gameCode: gameCode);

    //polling is 7 secs on prod and 6 seconds on debug
    _gameStartTimer =
        Timer.periodic(const Duration(seconds: kDebugMode ? 15 : 6), (_) {
      if (router.state.uri.path.replaceAll('/', '') == GameRoomScreen.id) {
        context.read<IsGameStartedCubit>().isGameStarted(gameCode: gameCode);
      }
    });
  }

  /// Stop polling
  void stopPolling() {
    _timer?.cancel();
    _gameStartTimer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    return MultiBlocListener(
      listeners: [
        BlocListener<IsGameStartedCubit, IsGameStartedState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => setState(() => isStartingGame = true),
              loaded: (value) {
                if (value) {
                  context.pushNamed(QuizLoaderScreen.id);
                }
              },
              error: (error) {
                setState(() => isStartingGame = false);
                ToastMessage.showError(
                  context: context,
                  text: error ?? '',
                );
              },
              orElse: () => setState(() => isRefreshingPlayers = false),
            );
          },
        ),
        BlocListener<ModifyGameRoomCubit, ModifyGameRoomState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (modifiedGame) {
                setState(
                  () {
                    isNewTeamMode = modifiedGame.teamMode;
                    isNewTeamFormationAutomatic = modifiedGame.teamFormation;
                  },
                );
                ToastMessage.showSuccess(
                  context: context,
                  text: context.appLocale.gameRooSetupUpdatedSuccessfully,
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocConsumer<AllPlayersCubit, AllPlayersState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: (players) => setState(() => isRefreshingPlayers = true),
            error: (players, error) {
              setState(() => isRefreshingPlayers = false);
              ToastMessage.showError(
                context: context,
                text: error ?? '',
              );
            },
            orElse: () => setState(() => isRefreshingPlayers = false),
          );
        },
        builder: (context, state) {
          final players = state.players ?? [];
          return Scaffold(
            body: DecoratedContainer(
              isAnimate: true,
              canPop: false,
              child: Column(
                children: [
                  SizedBox(height: context.topPadding),
                  Stack(
                    children: [
                      CustomBackButton(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => !widget.isGameMaster
                              ? const ConfirmLeaveGameRoomModal()
                              : ConfirmLeaveGameRoomModal(
                                  onTapIntent: () => Navigator.popUntil(
                                    context,
                                    (route) =>
                                        route.settings.name == PlayerScreen.id,
                                  ),
                                ),
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Center(
                          child: Text(
                            context.appLocale.gameRoom,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontFamily: FontFamily.margarine,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.gameCode,
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                players.length.toString(),
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.appLocale.gameCode,
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.5.sp,
                                ),
                              ),
                              Text(
                                context.appLocale.player(players.length),
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.5.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Wrap(
                                spacing: 65.w,
                                runSpacing: 15.w,
                                children: players
                                    .map(
                                      (player) => GameRoomPlayerProfileWidget(
                                        isGameMaster: player.isGameMaster,
                                        image: player.imageUrl ?? '',
                                        name: player.username == user?.username
                                            ? context.appLocale.you
                                            : player.isGameMaster
                                                ? context.appLocale.master
                                                : player.username,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          if (isRefreshingPlayers) ...[
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  context.appLocale.refreshingPlayers,
                                  textScaler: TextScaler.noScaling,
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const TypeWriterProgressTextIndicator(
                                  animationSeconds: 1,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                          if (widget.isGameMaster) ...[
                            Button(
                              label: isNewTeamMode == true
                                  ? context.appLocale.setTeam
                                  : context.appLocale.startPlaying,
                              isLoading: isStartingGame,
                              onPressed: () {
                                if (isNewTeamMode == false) {
                                  if (players.length < 2) {
                                    ToastMessage.showWarning(
                                      context: context,
                                      text:
                                          'Atleast 2 players must be in game room to start game',
                                    );
                                  } else {
                                    // start game
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) => BlocProvider(
                                        create: (context) => StartGameCubit(
                                          authBloc: context.read(),
                                        ),
                                        child: StartGameModal(
                                          gameCode: widget.gameCode,
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                    );
                                  }
                                }
                                if (isNewTeamMode == true) {
                                  if (players.length < 5) {
                                    ToastMessage.showWarning(
                                      context: context,
                                      text:
                                          'Atleast 5 players must be in game room to continue with team mode',
                                    );
                                    return;
                                  } else {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          isNewTeamMode == true
                                              ? SetTeamModal(
                                                  isTeamFormationAutomatic:
                                                      isNewTeamFormationAutomatic ??
                                                          false,
                                                )
                                              : const TeamAllSetModal(),
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            Button(
                              label: context.appLocale.modifyGameSetup,
                              isOutlined: true,
                              labelColor: AppColors.black15,
                              onPressed: () => showModalBottomSheet<String?>(
                                context: context,
                                builder: (context) =>
                                    ModifyGameSetupConfirmationModal(
                                  gameCode: widget.gameCode,
                                ),
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                              ).then((value) {
                                if (value != null &&
                                    value == 'modify_current_room') {
                                  if (!context.mounted) return;
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) => BlocProvider.value(
                                      value:
                                          context.read<ModifyGameRoomCubit>(),
                                      child: ModifyCurrentRoomModal(
                                        gameCode: widget.gameCode,
                                        isTeamMode: isNewTeamMode,
                                        isTeamFormationAutomatic:
                                            isNewTeamFormationAutomatic,
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ] else ...[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    isNewTeamMode == true
                                        ? context.appLocale
                                            .waitingForGameMasterToSetupTeam
                                        : context.appLocale
                                            .waitingForGameMasterToStartTheGame,
                                    textScaler: TextScaler.noScaling,
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                                const TypeWriterProgressTextIndicator(),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Button(
                              label: context.appLocale.leaveGameRoom,
                              onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const ConfirmLeaveGameRoomModal(),
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.btmPadding),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
