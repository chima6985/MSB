import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ChangeAvatarScreen extends HookWidget {
  const ChangeAvatarScreen({
    super.key,
  });
  static const String id = 'changeAvatarScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
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
                child: AppAssets.images.jpegs.profileImage.image(scale: 2.sp),
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
                        children: const [
                          _AvatarWidget(),
                          _AvatarWidget(),
                          _AvatarWidget(),
                          _AvatarWidget(),
                        ],
                      ),
                    ),
                    SizedBox(height: 75.h),
                    Button(
                      width: mqr.width * 0.8,
                      label: updateEn,
                      onPressed: () {},
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
  const _AvatarWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 72.w,
          height: 72.w,
          decoration: BoxDecoration(
            color: AppColors.blueE7,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.greyB6,
            ),
          ),
        ),
        SizedBox(
          width: 65.w,
          height: 65.w,
          child: FittedBox(
            child: AppAssets.images.jpegs.profileImage.image(),
          ),
        ),
      ],
    );
  }
}
