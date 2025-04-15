import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/user/cubits/user_cubit/user_cubit.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ChangeAvatarScreen extends HookWidget {
  const ChangeAvatarScreen({
    super.key,
  });
  static const String id = 'changeAvatarScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final selectedProfileAvatar = useState<String?>(null);
    final isSelected = useState<int?>(null);
    final user = context.watch<UserCubit>().state.user;
    final isMale = user?.gender == 'Male';

    return Scaffold(
      body: DecoratedContainer(
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
                        changeYourAvatarEn,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.w),
              Container(
                alignment: Alignment.bottomCenter,
                width: mqr.width,
                height: mqr.height * 0.23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AppAssets.images.jpegs.darkDecoratedBg.provider(),
                    fit: BoxFit.cover,
                  ),
                ),
                child: selectedProfileAvatar.value != null
                    ? Image.asset(
                        selectedProfileAvatar.value ?? '',
                        width: 150.sp,
                        height: 150.sp,
                      )
                    : null,
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
                        runSpacing: 15.w,
                        children: [
                          if (isMale) ...[
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man1.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man1.path;
                                isSelected.value = 0;
                              },
                              isSelected: isSelected.value == 0,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man2.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man2.path;
                                isSelected.value = 1;
                              },
                              isSelected: isSelected.value == 1,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man3.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man3.path;
                                isSelected.value = 2;
                              },
                              isSelected: isSelected.value == 2,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man4.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man4.path;
                                isSelected.value = 3;
                              },
                              isSelected: isSelected.value == 3,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man5.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man5.path;
                                isSelected.value = 4;
                              },
                              isSelected: isSelected.value == 4,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man6.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man6.path;
                                isSelected.value = 5;
                              },
                              isSelected: isSelected.value == 5,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man7.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man7.path;
                                isSelected.value = 6;
                              },
                              isSelected: isSelected.value == 6,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man8.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man8.path;
                                isSelected.value = 7;
                              },
                              isSelected: isSelected.value == 7,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man9.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man9.path;
                                isSelected.value = 8;
                              },
                              isSelected: isSelected.value == 8,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man10.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man10.path;
                                isSelected.value = 9;
                              },
                              isSelected: isSelected.value == 9,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man11.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man11.path;
                                isSelected.value = 10;
                              },
                              isSelected: isSelected.value == 10,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.man12.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.man12.path;
                                isSelected.value = 11;
                              },
                              isSelected: isSelected.value == 11,
                            ),
                          ] else ...[
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman1.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman1.path;
                                isSelected.value = 0;
                              },
                              isSelected: isSelected.value == 0,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman2.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman2.path;
                                isSelected.value = 1;
                              },
                              isSelected: isSelected.value == 1,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman3.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman3.path;
                                isSelected.value = 2;
                              },
                              isSelected: isSelected.value == 2,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman4.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman4.path;
                                isSelected.value = 3;
                              },
                              isSelected: isSelected.value == 3,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman5.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman5.path;
                                isSelected.value = 4;
                              },
                              isSelected: isSelected.value == 4,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman6.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman6.path;
                                isSelected.value = 5;
                              },
                              isSelected: isSelected.value == 5,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman7.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman7.path;
                                isSelected.value = 6;
                              },
                              isSelected: isSelected.value == 6,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman8.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman8.path;
                                isSelected.value = 7;
                              },
                              isSelected: isSelected.value == 7,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman9.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman9.path;
                                isSelected.value = 8;
                              },
                              isSelected: isSelected.value == 8,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman10.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman10.path;
                                isSelected.value = 9;
                              },
                              isSelected: isSelected.value == 9,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman11.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman11.path;
                                isSelected.value = 10;
                              },
                              isSelected: isSelected.value == 10,
                            ),
                            _AvatarWidget(
                              imagePath: AppAssets.images.jpegs.woman12.path,
                              onTap: () {
                                selectedProfileAvatar.value =
                                    AppAssets.images.jpegs.woman12.path;
                                isSelected.value = 11;
                              },
                              isSelected: isSelected.value == 11,
                            ),
                          ]
                        ],
                      ),
                    ),
                    SizedBox(height: 75.h),
                    Button(
                      width: mqr.width * 0.8,
                      label: updateEn,
                      onPressed: () {
                        if (selectedProfileAvatar.value != null) {
                          ToastMessage.showSuccess(
                            context: context,
                            text: 'Avatar has been updated',
                          );
                        } else {
                          ToastMessage.showError(
                            context: context,
                            text: 'Pleae select an avatar',
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
