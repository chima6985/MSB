import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class BookmarkScreen extends HookWidget {
  const BookmarkScreen({
    super.key,
  });
  static const String id = 'bookmarkScreen';

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
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
                        bookmarksEn,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: searchController,
                      labelText: searchBookMarksEn,
                      textFieldSubText: context.appLocale.gender,
                      prefix: const Icon(
                        Iconsax.search_normal_14,
                      ),
                    ),
                    _BookMarkWidget(
                      image: AppAssets.images.jpegs.alphabet.path,
                      title: 'Master the alphabets. Part 1',
                    ),
                    _BookMarkWidget(
                      image: AppAssets.images.jpegs.alphabet.path,
                      title: 'Master the alphabets. Part 2',
                    ),
                    _BookMarkWidget(
                      image: AppAssets.images.jpegs.alphabet.path,
                      title: 'Tone marks',
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

class _BookMarkWidget extends StatelessWidget {
  const _BookMarkWidget({
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
                width: 40.w,
                height: 40.w,
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
