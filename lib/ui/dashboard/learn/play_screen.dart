import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PlayScreen extends HookWidget {
  const PlayScreen({
    super.key,
  });
  static const String id = 'playScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    void navigateTo() {
      Future.delayed(5.seconds).then((_) {
        router.pushReplacementNamed(
          PlayQuestionScreen.id,
          extra: {
            'isPractice': true,
            'isTimed': false,
          },
        );
      });
    }

    return Scaffold(
      body: Container(
        width: mqr.width,
        height: mqr.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppAssets.images.jpegs.darkDecoratedBg.provider(),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.images.jpegs.lightBulb.image(scale: 1.6.sp),
            SizedBox(height: 20.h),
            Text(
              context.appLocale.timeForKnowledgeReview,
              style: context.textTheme.titleLarge!.copyWith(
                color: AppColors.white,
                fontFamily: FontFamily.margarine,
              ),
            ),
            SizedBox(height: 50.h),
            Button(
              label: context.appLocale.takeQuiz,
              onPressed: () => context
                ..pop()
                ..pushNamed(
                  QuizLoaderScreen.id,
                  extra: {'navigateTo': navigateTo},
                ),
            ),
            SizedBox(height: 20.h),
            Button(
              label: context.appLocale.backToLessons,
              borderColor: AppColors.white,
              isOutlined: true,
              onPressed: () => context.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
