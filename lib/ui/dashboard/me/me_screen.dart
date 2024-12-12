import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class MeScreen extends HookWidget {
  const MeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            SizedBox(height: context.topPadding + 100.h),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () => context.pushNamed(ChangeAvatarScreen.id),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 40.sp,
                    backgroundColor: AppColors.blue13,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.blueE7,
                    radius: 12.sp,
                    child: Icon(
                      Iconsax.edit_2,
                      color: AppColors.blue12,
                      size: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Olawale Adetokunbo',
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.margarine,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'tokunbobeardy@gmail.com',
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 12.7.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: _MeDashboardWidget(
                    lessonsCompleted: '13',
                    icon: AppAssets.images.jpegs.coin2.image(
                      width: 36.w,
                      height: 24.w,
                      fit: BoxFit.cover,
                    ),
                    title: coinEarnedYr,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _MeDashboardWidget(
                    lessonsCompleted: '13',
                    icon: AppAssets.images.jpegs.lessonCovered.image(
                      width: 36.w,
                      height: 24.w,
                    ),
                    title: lessonCoveredYr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Expanded(
                  child: _MeDashboardWidget(
                    lessonsCompleted: '13',
                    icon: AppAssets.images.svgs.bolt.svg(
                      width: 12.w,
                    ),
                    title: currentStreakYr,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _MeDashboardWidget(
                    lessonsCompleted: '13',
                    icon: AppAssets.images.svgs.bolt.svg(
                      width: 12.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.redFF,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: bestStreakYr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                completedLessonsEn,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            _CompletedLessonsWidget(
              image: AppAssets.images.jpegs.alphabet.path,
              title: 'Alphabets',
            ),
            _CompletedLessonsWidget(
              image: AppAssets.images.jpegs.a123.path,
              title: 'Numbers',
            ),
            _CompletedLessonsWidget(
              image: AppAssets.images.jpegs.chat.path,
              title: 'Conversation',
            ),
            _CompletedLessonsWidget(
              image: AppAssets.images.jpegs.chat.path,
              title: 'Item identification',
            ),
            SizedBox(height: 12.h),
            SizedBox(height: mqr.height * 0.2 + context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _MeDashboardWidget extends StatelessWidget {
  const _MeDashboardWidget({
    required this.lessonsCompleted,
    required this.icon,
    required this.title,
  });

  final String lessonsCompleted;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.greyB6,
        ),
      ),
      child: Column(
        children: [
          Text(
            lessonsCompleted,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          icon,
          const SizedBox(height: 10),
          Text(
            title,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodySmall!.copyWith(
              color: AppColors.grey95,
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedLessonsWidget extends StatelessWidget {
  const _CompletedLessonsWidget({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.greyB6,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 24.w,
                height: 24.w,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 12.7.sp,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.check_circle,
                color: AppColors.green4A,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
