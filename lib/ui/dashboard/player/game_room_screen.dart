import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/dashboard/player/team_all_set_modal.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class GameRoomScreen extends StatelessWidget {
  const GameRoomScreen({
    super.key,
    required this.gameCode,
    this.isMultiplayer = false,
    this.isTeamMode = false,
    this.isTeamFormationAutomatic = false,
  });

  final String gameCode;
  final bool isMultiplayer;
  final bool isTeamMode;
  final bool isTeamFormationAutomatic;

  static const String id = 'gameRoomScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllPlayersCubit(
        authBloc: context.read(),
      ),
      child: _GameRoomScreen(
        gameCode: gameCode,
        isMultiplayer: isMultiplayer,
        isTeamMode: isTeamMode,
        isTeamFormationAutomatic: isTeamFormationAutomatic,
      ),
    );
  }
}

class _GameRoomScreen extends StatefulWidget {
  const _GameRoomScreen({
    required this.gameCode,
    required this.isMultiplayer,
    required this.isTeamMode,
    required this.isTeamFormationAutomatic,
  });

  final String gameCode;
  final bool isMultiplayer;
  final bool isTeamMode;
  final bool isTeamFormationAutomatic;

  @override
  State<_GameRoomScreen> createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<_GameRoomScreen> {
  @override
  void initState() {
    super.initState();
    // if (!isMultiplayer) {
    //   Future.delayed(5.seconds).then((_) {
    //     if (context.mounted) {
    //       context.pushReplacementNamed(TeamAllSetScreen.id);
    //     }
    //   });
    // }
    context.read<AllPlayersCubit>().startPolling(gameCode: widget.gameCode);
  }

  @override
  void dispose() {
    context.read<AllPlayersCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => !widget.isMultiplayer
                        ? const ConfirmLeaveActionModal()
                        : ConfirmLeaveActionModal(
                            onTapIntent: () => Navigator.popUntil(
                              context,
                              (route) => route.settings.name == PlayerScreen.id,
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
                      gameRoomYr,
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
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '8',
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
                          'Game code',
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.5.sp,
                          ),
                        ),
                        Text(
                          'Players',
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
                          children: [
                            GameRoomProfileWidget(
                              isGameMaster: true,
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Master',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'You',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Tosin',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'P4',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Lateefah',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'Viko',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Angel',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'Kido',
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.isMultiplayer) ...[
                      Button(
                        label: widget.isTeamMode
                            ? setTeamYr
                            : context.appLocale.startPlaying,
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => widget.isTeamMode
                              ? SetTeamModal(
                                  isTeamFormationAutomatic:
                                      widget.isTeamFormationAutomatic,
                                )
                              : const TeamAllSetModal(),
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Button(
                        label: modifyGameSetupYr,
                        isOutlined: true,
                        labelColor: AppColors.black15,
                        onPressed: () => Navigator.popUntil(
                          context,
                          (route) => route.settings.name == PlayerScreen.id,
                        ),
                      ),
                    ] else ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'Waiting for the game master to set up the team',
                              style: context.textTheme.bodySmall!.copyWith(
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
                        label: leaveGameRoomYr,
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => const ConfirmLeaveActionModal(),
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
  }
}
