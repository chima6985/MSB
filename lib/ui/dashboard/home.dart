import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final isShowEmailVerify = useState(false);
    final isShowLessonsWidget = useState(false);
    final greetings = Functions.greetingMessage(context);
    final currentLocale = context.currentLocale;
    final user = context.watch<UserCubit>().state.user;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            if (isShowEmailVerify.value)
              GestureDetector(
                onTap: () => isShowEmailVerify.value = false,
                child: Container(
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
                        context.appLocale.verifyEmail,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () => context
                      .read<ModuleAndDifficultyCubit>()
                      .getSectionsAndDifficulty(),
                  child: Text(
                    greetings.first,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.goldFC.withValues(alpha: 0.1),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                greetings.last,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMedium,
              ),
            ),
            BlocBuilder<ModuleAndDifficultyCubit, ModuleAndDifficultyState>(
              builder: (context, state) {
                return state.maybeWhen(
                  error: (error) => Column(
                    children: [
                      SizedBox(height: mqr.height * 0.2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          error ?? '',
                          textScaler: TextScaler.noScaling,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Button(
                        width: mqr.width * 0.4,
                        label: context.appLocale.retry,
                        onPressed: () => context
                            .read<ModuleAndDifficultyCubit>()
                            .getSectionsAndDifficulty(),
                      ),
                    ],
                  ),
                  loading: () => Column(
                    children: [
                      SizedBox(height: mqr.height * 0.2),
                      const CustomSpinner(color: AppColors.black),
                    ],
                  ),
                  loaded: (sectionDifficulty) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isShowLessonsWidget.value) ...[
                        SizedBox(height: 26.h),
                        RichText(
                          text: TextSpan(
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontFamily: FontFamily.margarine,
                            ),
                            children: [
                              TextSpan(text: context.appLocale.lesson),
                              TextSpan(
                                text: ' (${context.appLocale.lesson})',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: FontFamily.margarine,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            if (user == null) {
                              Functions.showModalAuth(context);
                            } else {
                              context.pushNamed(ModuleScreen.id);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.purpleF1,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.appLocale.lesson1Of4,
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColors.blue12
                                                  .withValues(alpha: 0.12),
                                            ),
                                          ),
                                          Container(
                                            width: 120,
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColors.blue12,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context.appLocale.alphabets,
                                          textScaler: TextScaler.noScaling,
                                          style: context.textTheme.bodyLarge!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          context.appLocale.alphabets,
                                          textScaler: TextScaler.noScaling,
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      context.appLocale.continueTx,
                                      textScaler: TextScaler.noScaling,
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                      SizedBox(height: 15.h),
                      RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontFamily: FontFamily.margarine,
                          ),
                          children: [
                            TextSpan(text: context.appLocale.practice),
                            TextSpan(
                              text:
                                  ' (${currentLocale == yo ? context.enLocale.practice : context.yoLocale.practice})',
                              style: context.textTheme.bodySmall!.copyWith(
                                fontFamily: FontFamily.margarine,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          _QuickActionsPracticeWidget(
                            image: AppAssets.images.jpegs.proverb.image(
                              width: context.isTablet ? null : 78.w,
                              scale: context.isTablet ? 1.4 : null,
                            ),
                            width: mqr.width * 0.375,
                            section: PracticeSection.proverb,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _QuickActionsPracticeWidget(
                              image: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: AppAssets.images.jpegs.questionAndAnswer
                                    .image(
                                  width: context.isTablet ? null : 60.w,
                                  scale: context.isTablet ? 1.3 : null,
                                ),
                              ),
                              width: mqr.width * 0.38,
                              section: PracticeSection.qAndA,
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
                                width: context.isTablet ? null : 100.w,
                                scale: context.isTablet ? 1 : null,
                              ),
                              width: mqr.width * 0.38,
                              section: PracticeSection.meaning,
                            ),
                          ),
                          const SizedBox(width: 16),
                          _QuickActionsPracticeWidget(
                            image: AppAssets.images.jpegs.numbers.image(
                              width: context.isTablet ? null : 90.w,
                              scale: context.isTablet ? 1 : null,
                            ),
                            width: mqr.width * 0.375,
                            section: PracticeSection.numbers,
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
                            TextSpan(text: context.appLocale.play),
                            TextSpan(
                              text:
                                  ' (${currentLocale == yo ? context.enLocale.play : context.yoLocale.play})',
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
                              mainText: context.appLocale.singlePlayer,
                              subText: currentLocale == yo
                                  ? context.enLocale.singlePlayer
                                  : context.yoLocale.singlePlayer,
                              color: AppColors.lemon9C,
                              image: AppAssets.images.jpegs.singlePlayer.path,
                              onTap: () {
                                if (user == null) {
                                  Functions.showModalAuth(context);
                                } else {
                                  context.pushNamed(
                                    PlayerScreen.id,
                                    extra: {'isSinglePlayer': true},
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _QuickActionPlayWidget(
                              mainText: context.appLocale.multiPlayer,
                              subText: currentLocale == yo
                                  ? context.enLocale.multiPlayer
                                  : context.yoLocale.multiPlayer,
                              color: AppColors.lilac9E,
                              image: AppAssets.images.jpegs.multiplePlayer.path,
                              onTap: () {
                                if (user == null) {
                                  Functions.showModalAuth(context);
                                } else {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const ChooseMutliPlayerModeModal(),
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mqr.height * 0.2 + context.btmPadding),
                    ],
                  ),
                  orElse: SizedBox.new,
                );
              },
            ),
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
    required this.section,
  });

  final Widget image;
  final double width;
  final PracticeSection section;

  @override
  Widget build(BuildContext context) {
    final user = AppStorage.getUser();
    final currentLocale = context.currentLocale;
    final mainText = {
      PracticeSection.proverb: context.appLocale.proverb,
      PracticeSection.qAndA: context.appLocale.questionAndAnswer,
      PracticeSection.meaning: context.appLocale.meaning,
      PracticeSection.numbers: context.appLocale.numbers,
    };

    final subText = {
      PracticeSection.proverb: currentLocale == yo
          ? context.enLocale.proverb
          : context.yoLocale.proverb,
      PracticeSection.qAndA: currentLocale == yo
          ? context.enLocale.questionAndAnswer
          : context.yoLocale.questionAndAnswer,
      PracticeSection.meaning: currentLocale == yo
          ? context.enLocale.meaning
          : context.yoLocale.meaning,
      PracticeSection.numbers: currentLocale == yo
          ? context.enLocale.numbers
          : context.yoLocale.numbers,
    };

    final color = {
      PracticeSection.proverb: AppColors.purpleF1,
      PracticeSection.qAndA: AppColors.greenCE,
      PracticeSection.meaning: AppColors.lemonEC,
      PracticeSection.numbers: AppColors.greyB6,
    };
    return InkWell(
      onTap: () {
        if (user == null) {
          Functions.showModalAuth(context);
        } else {
          context.pushNamed(
            PlayerScreen.id,
            extra: {'isPractice': true},
          );
        }
      },
      child: context.isTablet
          ? Container(
              width: width,
              height: 205.h,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: color[section] ?? AppColors.purpleF1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: image,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              mainText[section]?.titleCase() ?? '',
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: context.isTablet ? 16.sp : null,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Transform.translate(
                              offset: const Offset(0, -3),
                              child: Text(
                                subText[section]?.titleCase() ?? '',
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
            )
          : Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: color[section] ?? AppColors.purpleF1,
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
                              mainText[section]?.titleCase() ?? '',
                              textScaler: TextScaler.noScaling,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -3),
                              child: Text(
                                subText[section]?.titleCase() ?? '',
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
    required this.onTap,
  });

  final String image;
  final Color color;
  final String mainText;
  final String subText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.isTablet ? 24 : 14),
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
                fontSize: context.isTablet ? 16.sp : null,
              ),
            ),
            if (context.isTablet) SizedBox(height: 8.h),
            Transform.translate(
              offset: const Offset(0, -3),
              child: Text(
                subText,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodySmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  fontSize: context.isTablet ? 12.sp : null,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Transform.translate(
                offset: Offset(context.isTablet ? 20.w : 0, 0),
                child: Image.asset(
                  image,
                  scale: context.isTablet ? 1.25 : 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
