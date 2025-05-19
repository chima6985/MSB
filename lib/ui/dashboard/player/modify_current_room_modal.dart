import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ModifyCurrentRoomModal extends HookWidget {
  const ModifyCurrentRoomModal({
    super.key,
    required this.gameCode,
    this.isTeamMode,
    this.isTeamFormationAutomatic,
  });

  final String gameCode;
  final bool? isTeamMode;
  final bool? isTeamFormationAutomatic;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.currentLocale;
    final isLoading = useState(false);
    final newTeamMode = useState<bool?>(isTeamMode);
    final newTeamFormationAutomatic = useState<bool?>(isTeamFormationAutomatic);

    return BlocListener<ModifyGameRoomCubit, ModifyGameRoomState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: (val) {
            isLoading.value = false;
            context.pop();
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
      child: Container(
        padding: EdgeInsets.only(left: 30.w, right: 25),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: Text(
                context.appLocale.modifyCurrentRoom,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            RichText(
              text: TextSpan(
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: context.appLocale.teamMode),
                  TextSpan(
                    text:
                        ' (${currentLocale == yo ? context.enLocale.teamMode : context.yoLocale.teamMode})',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            RichText(
              text: TextSpan(
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                children: [
                  TextSpan(
                    text: '(${context.appLocale.optional}: ',
                  ),
                  TextSpan(
                    text: context.appLocale.turnOnIfInvitingMoreThanFive,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: AppColors.black.withValues(alpha: 0.7),
                    ),
                  ),
                  TextSpan(
                    text: ')',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: AppColors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectFilledCategoryWidget(
                    title: context.appLocale.on,
                    isSelected: newTeamMode.value == true,
                    onTap: () => newTeamMode.value = true,
                  ),
                  SelectFilledCategoryWidget(
                    title: context.appLocale.off,
                    isSelected: newTeamMode.value == false,
                    onTap: () => newTeamMode.value = false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            if (newTeamMode.value != false) ...[
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: context.appLocale.teamFormation),
                    TextSpan(
                      text:
                          ' (${currentLocale == yo ? context.enLocale.teamFormation : context.yoLocale.teamFormation})',
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectFilledCategoryWidget(
                      title: context.appLocale.automatic,
                      isSelected: newTeamFormationAutomatic.value == true,
                      onTap: () => newTeamFormationAutomatic.value = true,
                    ),
                    SelectFilledCategoryWidget(
                      title: context.appLocale.manual,
                      isSelected: newTeamFormationAutomatic.value == false,
                      onTap: () => newTeamFormationAutomatic.value = false,
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40.h),
            Button(
              label: context.appLocale.confirmChanges,
              isLoading: isLoading.value,
              onPressed: () {
                if (isTeamMode == false && newTeamMode.value == false) {
                  ToastMessage.showInformation(
                    context: context,
                    text: context.appLocale.noChangesMadeToGameSettings,
                  );
                  return;
                }
                if (newTeamMode.value == true &&
                    isTeamFormationAutomatic ==
                        newTeamFormationAutomatic.value) {
                  ToastMessage.showInformation(
                    context: context,
                    text: context.appLocale.noChangesMadeToGameSettings,
                  );
                  return;
                }
                if (newTeamMode.value == true &&
                    newTeamFormationAutomatic.value == null) {
                  ToastMessage.showInformation(
                    context: context,
                    text: context.appLocale.pleaseSelectTeamFormationMode,
                  );
                  return;
                }
                context.read<ModifyGameRoomCubit>().modifyGameRoom(
                      gameCode: gameCode,
                      teamMode: newTeamMode.value ?? false,
                      teamFormation: (newTeamFormationAutomatic.value ?? false)
                          ? 'automatic'
                          : 'manual',
                    );
              },
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
