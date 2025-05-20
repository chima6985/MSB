import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ChangeAvatarScreen extends StatelessWidget {
  const ChangeAvatarScreen({super.key});

  static const String id = 'changeAvatarScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserCubit(
        authBloc: context.read(),
        userCubit: context.read(),
      ),
      child: const _ChangeAvatarScreen(),
    );
  }
}

class _ChangeAvatarScreen extends HookWidget {
  const _ChangeAvatarScreen();

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final isLoading = useState(false);
    final selectedProfileAvatar = useState<String?>(null);
    final user = context.watch<UserCubit>().state.user;
    final isMale = user?.gender == 'Male';
    final image = user?.image ?? '';

    final avatars = isMale ? maleAvatars : femaleAvatars;

    return BlocListener<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) {
        state.maybeWhen(
          updating: () => isLoading.value = true,
          updated: () {
            isLoading.value = false;
            ToastMessage.showSuccess(
              context: context,
              text: context.appLocale.successfullyUpdatedImageAvatar,
            );
            context.pop(true);
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
      child: Scaffold(
        body: DecoratedContainer(
          canPop: !isLoading.value,
          child: AbsorbPointer(
            absorbing: isLoading.value,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: context.topPadding),
                  Stack(
                    children: [
                      const CustomBackButton(),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Center(
                          child: Text(
                            context.appLocale.changeYourAvatar,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontFamily: FontFamily.margarine,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Hero(
                    tag: 'profile_image',
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: mqr.width,
                      height: mqr.height * 0.23,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AppAssets.images.jpegs.darkDecoratedBg.provider(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: selectedProfileAvatar.value != null
                          ? Image.asset(
                              selectedProfileAvatar.value ?? '',
                              width: 150.sp,
                              height: 150.sp,
                            )
                          : image.isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl: user?.image ?? '',
                                  width: 150.sp,
                                  height: 150.sp,
                                  errorWidget: (context, _, error) => Icon(
                                    Iconsax.user4,
                                    size: 27.w,
                                    color: AppColors.white,
                                  ),
                                  progressIndicatorBuilder: (context, _, val) =>
                                      Icon(
                                    Iconsax.user4,
                                    size: 27.w,
                                    color: AppColors.white,
                                  ),
                                )
                              : null,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            selectAnAvatarOfYourChoiceEn,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 13.w,
                            runSpacing: 16.w,
                            children: avatars
                                .map(
                                  (avatar) => _AvatarWidget(
                                    imagePath: avatar,
                                    onTap: () {
                                      selectedProfileAvatar.value = avatar;
                                    },
                                    isSelected:
                                        selectedProfileAvatar.value == avatar,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 75.h),
                        Button(
                          width: mqr.width * 0.8,
                          label: context.appLocale.update,
                          isLoading: isLoading.value,
                          onPressed: () {
                            if (selectedProfileAvatar.value == null) {
                              ToastMessage.showWarning(
                                context: context,
                                text: context.appLocale.pleaseSelectAnAvatar,
                              );
                            } else {
                              context.read<UpdateUserCubit>().updateUserImage(
                                    imagePath:
                                        selectedProfileAvatar.value ?? '',
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.btmPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    required this.imagePath,
    required this.onTap,
    this.isSelected = false,
  });

  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: AppColors.blueE7,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.black15.withValues(alpha: 0.85)
                    : AppColors.greyB6,
              ),
            ),
          ),
          Image.asset(
            imagePath,
            width: 65.w,
            height: 65.w,
          ),
        ],
      ),
    );
  }
}
