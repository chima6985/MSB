import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ModuleScreen extends StatelessWidget {
  const ModuleScreen({
    super.key,
    required this.title,
  });
  static const String id = 'moduleScreen';

  final String title;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final isBookmarked = ValueNotifier(false);
    return Scaffold(
      body: DecoratedContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.topPadding),
              Stack(
                children: [
                  const CustomBackButton(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        title,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'First part of the alphabets',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Transform.translate(
                          offset: const Offset(15, 0),
                          child: TextButton(
                            onPressed: () {
                              if (isBookmarked.value == true) {
                                ToastMessage.showWarning(
                                  context: context,
                                  text: 'Lesson removed from bookmark',
                                );
                                isBookmarked.value = false;
                              } else {
                                ToastMessage.showSuccess(
                                  context: context,
                                  text: 'Lesson added to bookmark',
                                );
                                isBookmarked.value = true;
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: isBookmarked,
                                  builder: (context, bookmarked, child) {
                                    return bookmarked
                                        ? AppAssets.images.svgs.bookmarked.svg()
                                        : AppAssets.images.svgs.bookmark.svg();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.clock,
                          size: 18.sp,
                          color: AppColors.black15,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'About 13mins to complete',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "In this module, you'll embark on an exciting journey to learn the alphabets of the Yoruba language. We'll guide you through each letter, helping you understand how to pronounce and write them, as well as recognize their unique sounds. ",
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              const Divider(
                color: AppColors.blackB6,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "In this module, you'll embark on an exciting journey to learn the alphabets of the Yoruba language. We'll guide you through each letter, helping you understand how to pronounce and write them, as well as recognize their unique sounds. ",
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Title',
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.blackB6,
                        ),
                      ),
                      child: Container(
                        height: 100.h,
                        width: mqr.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.6),
                        ),
                        child: AppAssets.images.jpegs.alphabet.image(),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "In this module, you'll embark on an exciting journey to learn the alphabets of the Yoruba language. We'll guide you through each letter, helping you understand how to pronounce and write them, as well as recognize their unique sounds. ",
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Title',
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.blackB6,
                        ),
                      ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColors.blackB6.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(
                            3.6,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "In this module, you'll embark on an exciting journey to learn the alphabets of the Yoruba language. We'll guide you through each letter, helping you understand how to pronounce and write them, as well as recognize their unique sounds. ",
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              const Divider(
                color: AppColors.blackB6,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextButton(
                  onPressed: () => isBookmarked.value = !isBookmarked.value,
                  child: ValueListenableBuilder(
                    valueListenable: isBookmarked,
                    builder: (context, bookmarked, child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (bookmarked)
                            AppAssets.images.svgs.bookmarked.svg()
                          else
                            AppAssets.images.svgs.bookmark.svg(),
                          const SizedBox(width: 8),
                          Text(
                            bookmarked ? 'Bookmarked' : 'Bookmark module',
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Button(
                  label: 'Take Quiz',
                  onPressed: () => context.pushNamed(PlayScreen.id),
                ),
              ),
              SizedBox(height: context.btmPadding + 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
