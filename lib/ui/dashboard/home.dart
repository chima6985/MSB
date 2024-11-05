import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.topPadding),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
              decoration: BoxDecoration(
                color: AppColors.blueE6,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.blue00,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline_outlined,
                    size: 21,
                    color: AppColors.blue00,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    verifyEmailEr,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  goodAfternoonYr,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontFamily: 'Margarine',
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.goldFC.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.goldCE,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppAssets.images.jpegs.coin2.image(
                        width: 24.w,
                        height: 24.w,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '0',
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.goldCE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              goodAfternoonEn,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 26),
            RichText(
              text: TextSpan(
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
                children: [
                  const TextSpan(text: lessonYr),
                  TextSpan(
                    text: ' ($lessonEr)',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontFamily: FontFamily.margarine,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.purpleF1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson1Of4,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              height: 4.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.purple12.withOpacity(0.12),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 4.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.purple12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          '12%',
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppAssets.images.jpegs.alphabet.image(
                        width: 40.w,
                        height: 40.w,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alphabetsEr,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            alphabetsYr,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        continueEn,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
                children: [
                  const TextSpan(text: practiceYr),
                  TextSpan(
                    text: ' ($practiceEr)',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontFamily: FontFamily.margarine,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _QuickActionsPracticeWidget(
                  image: AppAssets.images.jpegs.proverb.image(
                    width: 78.w,
                  ),
                  width: mqr.width * 0.375,
                  color: AppColors.purpleF1,
                  mainText: proverbYr,
                  subText: proverbEr,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _QuickActionsPracticeWidget(
                    image: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: AppAssets.images.jpegs.questionAndAnswer.image(
                        width: 60.w,
                      ),
                    ),
                    width: mqr.width * 0.38,
                    color: AppColors.greenCE,
                    mainText: questionAndAnswerYr,
                    subText: questionAndAnswerEr,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _QuickActionsPracticeWidget(
                    image: AppAssets.images.jpegs.meaning.image(
                      width: 100.w,
                    ),
                    width: mqr.width * 0.38,
                    color: AppColors.lemonEC,
                    mainText: meaningYr,
                    subText: meaningEn,
                  ),
                ),
                const SizedBox(width: 16),
                _QuickActionsPracticeWidget(
                  image: AppAssets.images.jpegs.numbers.image(
                    width: 90.w,
                  ),
                  width: mqr.width * 0.375,
                  color: AppColors.greyB6,
                  mainText: numbersYr,
                  subText: numbersEn,
                ),
              ],
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
                children: [
                  const TextSpan(text: playYr),
                  TextSpan(
                    text: ' ($playEn)',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontFamily: FontFamily.margarine,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _QuickActionPlayWidget(
                    mainText: singlePlayerYr,
                    subText: singlePlayerEn,
                    color: AppColors.lemon9C,
                    image: AppAssets.images.jpegs.singlePlayer.path,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _QuickActionPlayWidget(
                    mainText: multiPlayerYr,
                    subText: multiPlayerEn,
                    color: AppColors.lilac9E,
                    image: AppAssets.images.jpegs.multiplePlayer.path,
                  ),
                ),
              ],
            ),
            SizedBox(height: mqr.height * 0.2 + context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsPracticeWidget extends StatelessWidget {
  const _QuickActionsPracticeWidget({
    required this.image,
    required this.width,
    required this.color,
    required this.mainText,
    required this.subText,
  });

  final Widget image;
  final double width;
  final Color color;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: image,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              Transform.translate(
                offset: const Offset(0, -13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mainText,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -3),
                      child: Text(
                        subText,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionPlayWidget extends StatelessWidget {
  const _QuickActionPlayWidget({
    required this.image,
    required this.color,
    required this.mainText,
    required this.subText,
  });

  final String image;
  final Color color;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            textScaler: TextScaler.noScaling,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -3),
            child: Text(
              subText,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodySmall!.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Image.asset(
              image,
              scale: 3,
            ),
          ),
        ],
      ),
    );
  }
}
