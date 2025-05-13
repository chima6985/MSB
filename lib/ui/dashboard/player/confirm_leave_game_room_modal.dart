import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ConfirmLeaveGameRoomModal extends StatelessWidget {
  const ConfirmLeaveGameRoomModal({
    super.key,
    this.onTapIntent,
  });

  final VoidCallback? onTapIntent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaveGameRoomCubit(
        authBloc: context.read(),
      ),
      child: _ConfirmLeaveGameRoomModal(onTapIntent: onTapIntent),
    );
  }
}

class _ConfirmLeaveGameRoomModal extends HookWidget {
  const _ConfirmLeaveGameRoomModal({
    this.onTapIntent,
  });

  final VoidCallback? onTapIntent;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return BlocListener<LeaveGameRoomCubit, LeaveGameRoomState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: onTapIntent ??
              () => context
                ..pop(context)
                ..pop(context),
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(Iconsax.close_circle),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              context.appLocale.confirmAction,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.margarine,
              ),
            ),
            SizedBox(height: 32.h),
            AppAssets.images.jpegs.exitDoor.image(scale: 4),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                context.appLocale.sureToLeaveGame,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 62.h),
            Button(
              label: context.appLocale.leaveRoom,
              isLoading: isLoading.value,
              onPressed: () =>
                  context.read<LeaveGameRoomCubit>().leaveGameRoom(),
            ),
            const SizedBox(height: 24),
            Button(
              label: context.appLocale.dontLeave,
              isOutlined: true,
              labelColor: AppColors.black15,
              onPressed: () => context..pop(context),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
