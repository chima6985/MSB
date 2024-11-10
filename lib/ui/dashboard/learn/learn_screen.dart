import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LearnScreen extends HookWidget {
  const LearnScreen({
    super.key,
    this.currentPosition,
  });

  final ValueNotifier<int>? currentPosition;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 23),
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Row(
              children: [
                Text(
                  lessonYr.toLowerCase(),
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontFamily: FontFamily.margarine,
                  ),
                ),
                const Spacer(),
                AppAssets.images.svgs.bolt.svg(),
                const SizedBox(width: 8),
                Text(
                  '1',
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _LessonsListTileWidget(
              image: AppAssets.images.jpegs.alphabet.path,
              title: 'Alphabets',
              isLocked: false,
              onTap: () => context.pushNamed(LearnIntroScreen.id),
            ),
            _LessonsListTileWidget(
              image: AppAssets.images.jpegs.a123.path,
              title: 'Numbers',
            ),
            _LessonsListTileWidget(
              image: AppAssets.images.jpegs.chat.path,
              title: 'Conversation',
            ),
            _LessonsListTileWidget(
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

class _LessonsListTileWidget extends StatelessWidget {
  const _LessonsListTileWidget({
    required this.image,
    required this.title,
    this.isLocked = true,
    this.onTap,
  });

  final String image;
  final String title;
  final bool isLocked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLocked,
      child: Column(
        children: [
          InkWell(
            onTap: () => onTap?.call(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: isLocked ? 0.6 : 1.5,
                  color: isLocked
                      ? AppColors.purple12.withOpacity(0.6)
                      : AppColors.purple12,
                ),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: title,
                    child: Image.asset(
                      width: 40.w,
                      height: 40.w,
                      image,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Beginner',
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.titleSmall!.copyWith(
                                color: AppColors.grey95,
                                fontSize: 11.3.sp,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: AppColors.grey95,
                              ),
                            ),
                            Text(
                              '4 modules',
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.grey95,
                                fontSize: 11.3.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isLocked ? Iconsax.lock_15 : Iconsax.unlock,
                    color: AppColors.blue38,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
