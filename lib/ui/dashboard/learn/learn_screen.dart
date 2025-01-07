import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class LearnScreen extends HookWidget {
  const LearnScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final type = useState('your_lessons');
    final scrollController = useScrollController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.topPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
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
          ),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 21),
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SelectLearnDifficultyWidget(
                  title: 'Your lessons',
                  isSelected: type.value == 'your_lessons',
                  onTap: () {
                    type.value = 'your_lessons';
                    Functions.autoScroll(
                      controller: scrollController,
                      position: 0,
                    );
                  },
                ),
                _SelectLearnDifficultyWidget(
                  title: 'Beginner',
                  isSelected: type.value == 'beginner',
                  onTap: () {
                    type.value = 'beginner';
                    Functions.autoScroll(
                      controller: scrollController,
                      position: mqr.width * 0.1,
                    );
                  },
                ),
                _SelectLearnDifficultyWidget(
                  title: 'Intermediate',
                  isSelected: type.value == 'intermediate',
                  onTap: () {
                    type.value = 'intermediate';
                    Functions.autoScroll(
                      controller: scrollController,
                      position: mqr.width * 0.1,
                    );
                  },
                ),
                _SelectLearnDifficultyWidget(
                  title: 'Advanced',
                  isSelected: type.value == 'advanced',
                  onTap: () {
                    type.value = 'advanced';
                    Functions.autoScroll(
                      controller: scrollController,
                      position: mqr.width * 0.1,
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 35.h),
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
    );
  }
}

class _SelectLearnDifficultyWidget extends StatelessWidget {
  const _SelectLearnDifficultyWidget({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? AppColors.blueE7 : null,
              border: isSelected
                  ? Border.all(
                      width: 0.6,
                      color: isSelected ? AppColors.blue12 : AppColors.blackB6,
                    )
                  : null,
            ),
            child: Text(
              title,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: isSelected ? FontWeight.w400 : FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(width: 9),
      ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: AbsorbPointer(
        absorbing: isLocked,
        child: Column(
          children: [
            InkWell(
              onTap: () => onTap?.call(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: isLocked ? 0.75 : 1.5,
                    color: isLocked ? AppColors.blackB6 : AppColors.blue12,
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
                      color: isLocked ? AppColors.blackB6 : AppColors.blue38,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
