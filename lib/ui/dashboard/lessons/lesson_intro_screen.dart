import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LessonIntroScreen extends StatelessWidget {
  const LessonIntroScreen({super.key});
  static const String id = 'lessonIntroScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        isAnimate: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.topPadding),
              Text(
                alphabetsEr,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: 'Margarine',
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 8),
              Hero(
                tag: 'Alphabets',
                child: AppAssets.images.jpegs.alphabet.image(scale: 3.8),
              ),
              SizedBox(height: 22.h),
              Text(
                alphabetLesson,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(height: 60.h),
              Button(
                label: goToModulesEr,
                onPressed: () => context.pushNamed(ModulesScreen.id),
              ),
              const SizedBox(height: 16),
              Button(
                label: backToLessonsYr,
                isOutlined: true,
                labelColor: AppColors.black15,
                onPressed: () => context.pop(context),
              ),
              SizedBox(height: context.btmPadding + 38.h),
            ],
          ),
        ),
      ),
    );
  }
}
