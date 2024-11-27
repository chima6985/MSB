import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlayQuestionScreen extends StatefulWidget {
  const PlayQuestionScreen({
    super.key,
    this.isPractice = false,
    this.isTimed = true,
  });
  static const String id = 'playQuestionScreen';

  final bool isPractice;
  final bool isTimed;

  @override
  State<PlayQuestionScreen> createState() => _PlayQuestionScreenState();
}

class _PlayQuestionScreenState extends State<PlayQuestionScreen> {
  List<String> wordTile = ['U', 'I', 'P', 'E', 'L', 'M'];
  List<String> correctWordTile = ['P', 'E', 'L', 'U', 'M', 'I'];
  bool isActivateNextButton = false;
  bool? isWordTileArrangedCorrectly;
  String? selectedMultipleOption;
  final selectedMultipleOptionAnswer = 'Asiiro';
  bool? isMultipleOption;
  final _textEditingController = TextEditingController();
  String? selectedFillWordOption;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = {
      true: AppColors.greenCE,
      false: AppColors.redFF.withOpacity(0.2),
    };

    final brColor = {
      true: AppColors.green62,
      false: AppColors.redFF,
    };

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
                  Center(
                    child: Text(
                      practiceYr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                        height: 1.8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${proverbEr}s',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontFamily: FontFamily.margarine,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  proverbYr,
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontFamily: FontFamily.margarine,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
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
                    SizedBox(height: 40.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Question 321',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ibeere Ọ̀kolelò̀ọ́dúnrún lékan',
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (widget.isTimed)
                            FittedBox(
                              child: CircularPercentIndicator(
                                radius: 23,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 6.6,
                                backgroundWidth: 1.2,
                                percent: 0.7,
                                center: Text(
                                  '26',
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: AppColors.greyB6,
                                progressColor: AppColors.goldFC,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.greyDB,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  lineHeight: 10,
                                  percent: 0.2,
                                  progressColor: AppColors.blue12,
                                  backgroundColor: AppColors.greyDB,
                                  animation: true,
                                  barRadius: const Radius.circular(12),
                                ),
                              ),
                              if (!widget.isPractice) ...[
                                SizedBox(width: 25.w),
                                const Icon(
                                  Iconsax.heart_slash5,
                                  color: AppColors.blackB6,
                                  size: 16,
                                ),
                                const Icon(
                                  Iconsax.heart5,
                                  color: AppColors.redFF,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Iconsax.heart5,
                                  color: AppColors.redFF,
                                  size: 16,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ki ni itumò òrò náà?',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'What does the term mean?',
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                RichText(
                                  text: TextSpan(
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Awon wo ni Yorubá n pè ní',
                                      ),
                                      TextSpan(
                                        text: ' Oníyangí ',
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const TextSpan(text: '?'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 65.h),
                                Row(
                                  children: [
                                    ActionButton(
                                      label: 'Listen',
                                      isEnabled: true,
                                      icon: AppAssets.images.svgs.listen.svg(
                                        width: 17.sp,
                                        height: 17.sp,
                                      ),
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 24),
                                    ActionButton(
                                      label: 'Speak',
                                      isEnabled: true,
                                      icon: Icon(
                                        Iconsax.microphone_2,
                                        size: 17.sp,
                                        color: AppColors.black15,
                                      ),
                                      onTap: () {},
                                    ),
                                    const Spacer(),
                                    ActionButton(
                                      label: 'Flip',
                                      isEnabled: false,
                                      icon: Icon(
                                        Icons.swipe_right_rounded,
                                        size: 17.sp,
                                        color: AppColors.black15,
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 45.h,
                      child: ReorderableListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        onReorder: (i, j) {
                          setState(() {
                            if (j > i) j--;
                            final tile = wordTile.removeAt(i);
                            wordTile.insert(j, tile);
                            isActivateNextButton = true;
                            isWordTileArrangedCorrectly = null;
                          });
                        },
                        children: [
                          for (int i = 0; i < wordTile.length; i++)
                            Padding(
                              key: ValueKey(i),
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                width: 32.w,
                                height: 32.w,
                                decoration: BoxDecoration(
                                  color: bgColor[isWordTileArrangedCorrectly] ??
                                      AppColors.blueE7,
                                  border: Border.all(
                                    color:
                                        brColor[isWordTileArrangedCorrectly] ??
                                            AppColors.greyB6,
                                    width: 0.6,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    wordTile[i],
                                    style:
                                        context.textTheme.bodyLarge!.copyWith(),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        '* Long press on a tile to move and form the word',
                        textAlign: TextAlign.start,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AbsorbPointer(
                      absorbing: isActivateNextButton == false,
                      child: Opacity(
                        opacity: isActivateNextButton ? 1 : 0.7,
                        child: Button(
                          label: nextYr,
                          onPressed: () {
                            var isWordCorrect = false;
                            for (var i = 0; i < wordTile.length; i++) {
                              if (wordTile[i] != correctWordTile[i]) {
                                isWordCorrect = false;
                                break;
                              } else {
                                isWordCorrect = true;
                              }
                            }
                            setState(() {
                              if (isWordCorrect) {
                                isWordTileArrangedCorrectly = true;
                              } else {
                                isWordTileArrangedCorrectly = false;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h),
                    Center(
                      child: Text(
                        '* $selectAnswersFromOptionBelowYr',
                        textAlign: TextAlign.start,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SelectCategoryWidget2(
                      title: 'Tiiro',
                      isSelected: selectedMultipleOption == 'Tiiro',
                      bgColor: bgColor[isMultipleOption],
                      brColor: brColor[isMultipleOption],
                      onTap: () {
                        setState(() {
                          selectedMultipleOption = 'Tiiro';
                          isMultipleOption = null;
                        });
                      },
                    ),
                    SelectCategoryWidget2(
                      title: 'Asiiro',
                      isSelected: selectedMultipleOption == 'Asiiro',
                      bgColor: bgColor[isMultipleOption],
                      brColor: brColor[isMultipleOption],
                      onTap: () {
                        setState(() {
                          selectedMultipleOption = 'Asiiro';
                          isMultipleOption = null;
                        });
                      },
                    ),
                    SelectCategoryWidget2(
                      title: 'Asiiro',
                      isSelected: selectedMultipleOption == 'Asiiroo',
                      bgColor: bgColor[isMultipleOption],
                      brColor: brColor[isMultipleOption],
                      onTap: () {
                        setState(() {
                          selectedMultipleOption = 'Asiiroo';
                          isMultipleOption = null;
                        });
                      },
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      textEditingController: _textEditingController,
                      textFieldText: writeYourAnswerHereYr,
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        '* $formTheSentenceYr',
                        textAlign: TextAlign.start,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectCategoryWidget(
                          title: 'ògún',
                          isSelected: selectedFillWordOption == 'ògún',
                          onTap: () {
                            setState(() {
                              selectedFillWordOption = 'ògún';
                            });
                          },
                        ),
                        SelectCategoryWidget(
                          title: 'ogun',
                          isSelected: selectedFillWordOption == 'ogun',
                          onTap: () {
                            setState(() {
                              selectedFillWordOption = 'ogun';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 5),
                          child: AppAssets.images.svgs.listen.svg(
                            width: 17.sp,
                            height: 17.sp,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectMatchingImageYr,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              selectMatchingImageEn,
                              textAlign: TextAlign.start,
                              style: context.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'ilú',
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ImagePickerOption(imageTitle: 'Drum'),
                        SizedBox(width: 25),
                        _ImagePickerOption(imageTitle: 'Village'),
                      ],
                    ),
                    SizedBox(height: 40.h),
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

class _ImagePickerOption extends StatelessWidget {
  const _ImagePickerOption({
    required this.imageTitle,
  });

  final String imageTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.black.withOpacity(
                0.8,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: AppColors.greyB6.withOpacity(0.4),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          imageTitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool isEnabled;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) {
          onTap.call();
        }
      },
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.5,
                  color: AppColors.black15,
                ),
              ),
              child: icon,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              textAlign: TextAlign.start,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
