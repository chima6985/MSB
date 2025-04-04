import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class QuizLoaderScreen extends HookWidget {
  const QuizLoaderScreen({
    super.key,
    this.navigateTo,
  });
  static const String id = 'quizLoaderScreen';

  final VoidCallback? navigateTo;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    useEffect(() {
      if (navigateTo != null) {
        navigateTo?.call();
      }
      return null;
    });
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
            AppAssets.images.jpegs.masoyinboLogo
                .image(
                  width: 85.w,
                  height: 85.w,
                )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                  delay: 1.seconds,
                )
                .scale(
                  duration: 1.65.seconds,
                  begin: const Offset(1.1, 1.1),
                  end: const Offset(0.9, 0.9),
                  curve: Curves.easeInCubic,
                ),
            SizedBox(height: 24.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.appLocale.questionIsComing,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.white,
                    fontFamily: FontFamily.margarine,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 1.6.sp),
                  child: const TypeWriterProgressTextIndicator(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              pleaseWaitForQuestionsYr,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
