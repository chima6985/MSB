import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class GameRoomCreatedScreen extends StatelessWidget {
  const GameRoomCreatedScreen({
    super.key,
    required this.gameCode,
    this.isTeamMode = false,
    this.isTeamFormationAutomatic = false,
  });

  final String gameCode;
  final bool isTeamMode;
  final bool isTeamFormationAutomatic;

  static const String id = 'gameRoomCreatedScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeaveGameRoomCubit(
            authBloc: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => JoinGameRoomCubit(
            authBloc: context.read(),
          ),
        ),
      ],
      child: _GameRoomCreatedScreen(
        gameCode: gameCode,
        isTeamMode: isTeamMode,
        isTeamFormationAutomatic: isTeamFormationAutomatic,
      ),
    );
  }
}

class _GameRoomCreatedScreen extends HookWidget {
  const _GameRoomCreatedScreen({
    required this.gameCode,
    required this.isTeamMode,
    required this.isTeamFormationAutomatic,
  });

  final String gameCode;
  final bool isTeamMode;
  final bool isTeamFormationAutomatic;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return MultiBlocListener(
      listeners: [
        BlocListener<LeaveGameRoomCubit, LeaveGameRoomState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => isLoading.value = true,
              loaded: () {
                isLoading.value = false;
                context.read<JoinGameRoomCubit>().joinGameRoom(
                      gameCode: gameCode,
                    );
              },
              error: (error) {
                isLoading.value = false;
                ToastMessage.showError(
                  context: context,
                  text: error ?? '',
                );
                context.read<JoinGameRoomCubit>().joinGameRoom(
                      gameCode: gameCode,
                    );
              },
              orElse: () => isLoading.value = false,
            );
          },
        ),
        BlocListener<JoinGameRoomCubit, JoinGameRoomState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => isLoading.value = true,
              loaded: () {
                isLoading.value = false;
                context.pushNamed(
                  GameRoomScreen.id,
                  extra: {
                    'gameCode': gameCode,
                    'isGameMaster': true,
                    'isTeamMode': isTeamMode,
                    'isTeamFormationAutomatic': isTeamFormationAutomatic,
                  },
                );
              },
              error: (error) {
                isLoading.value = false;
                ToastMessage.showError(
                  context: context,
                  text: error ?? '',
                );
              },
              orElse: () => isLoading.value = false,
            );
          },
        ),
      ],
      child: Scaffold(
        body: DecoratedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.topPadding),
              Stack(
                children: [
                  const CustomBackButton(),
                  Center(
                    child: Text(
                      context.appLocale.gameRoomCreated,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                        height: 1.8,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      AppAssets.images.jpegs.masoyinboLogo
                          .image(
                            scale: 4,
                          )
                          .animate(
                            onComplete: (controller) => controller.repeat(),
                          )
                          .shimmer(
                            color: AppColors.white.withValues(alpha: 0.45),
                            size: 0.9,
                            curve: Curves.slowMiddle,
                            duration: 1900.ms,
                            delay: 2.seconds,
                          ),
                      const SizedBox(height: 15),
                      Text(
                        context.appLocale.inviteFriendsToYourGame,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () =>
                            Functions.copyTextToClipBoard(context, gameCode),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  gameCode,
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  Iconsax.copy,
                                  size: 17.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        context.appLocale.isYourGameCode,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 24),
                      Button(
                        label: context.appLocale.shareGame,
                        onPressed: () => Share.share(
                          'Join my game room on Masoyinbo with //',
                        ),
                      ),
                      const SizedBox(height: 24),
                      Button(
                        label: context.appLocale.goToGameRoom,
                        isOutlined: true,
                        isLoading: isLoading.value,
                        labelColor: AppColors.black15,
                        loadingIndicatorColor: AppColors.blue12,
                        onPressed: () =>
                            context.read<LeaveGameRoomCubit>().leaveGameRoom(),
                      ),
                      SizedBox(height: context.btmPadding + 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
