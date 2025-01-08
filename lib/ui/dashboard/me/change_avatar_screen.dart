import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
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
              SizedBox(height: 25.h),
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
                        runSpacing: 16.w,
                        children: [
                          _AvatarWidget(
                            imagePath: AppAssets.images.jpegs.profileImage.path,
                            onTap: () {
                              selectedProfileAvatar.value =
                                  AppAssets.images.jpegs.profileImage.path;
                              isSelected.value = 0;
                            },
                            isSelected: isSelected.value == 0,
                          ),
                          _AvatarWidget(
                            imagePath:
                                AppAssets.images.jpegs.profileImage1.path,
                            onTap: () {
                              selectedProfileAvatar.value =
                                  AppAssets.images.jpegs.profileImage1.path;
                              isSelected.value = 1;
                            },
                            isSelected: isSelected.value == 1,
                          ),
                          _AvatarWidget(
                            imagePath: AppAssets.images.jpegs.profileImage.path,
                            onTap: () {
                              selectedProfileAvatar.value =
                                  AppAssets.images.jpegs.profileImage.path;
                              isSelected.value = 2;
                            },
                            isSelected: isSelected.value == 2,
                          ),
                          _AvatarWidget(
                            imagePath:
                                AppAssets.images.jpegs.profileImage1.path,
                            onTap: () {
                              selectedProfileAvatar.value =
                                  AppAssets.images.jpegs.profileImage1.path;
                              isSelected.value = 3;
                            },
                            isSelected: isSelected.value == 3,
                          ),
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
