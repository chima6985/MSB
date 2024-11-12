import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PaymentScreen extends HookWidget {
  const PaymentScreen({
    super.key,
  });
  static const String id = 'paymentScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedContainer(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AppAssets.images.jpegs.trapeziumBlue.image(),
            Column(
              children: [
                SizedBox(height: context.topPadding),
                const CustomBackButton(
                  buttonColor: AppColors.white,
                ),
                Transform.translate(
                  offset: Offset(0, -25.h),
                  child: AppAssets.images.jpegs.stars.image(scale: 1.99.sp),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Text(
                    premiumPlanEn,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: RawScrollbar(
                      thumbColor: AppColors.black15.withOpacity(0.6),
                      radius: const Radius.circular(5),
                      thickness: 2,
                      thumbVisibility: true,
                      minOverscrollLength: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  withPremiumPlansEn,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Column(
                                children: [
                                  _PremiumInfoWidget(
                                    image: AppAssets.images.jpegs.books.path,
                                    title: accessAdvancedLessonsEn,
                                    subtitle: unlockMoreIndepthEn,
                                  ),
                                  _PremiumInfoWidget(
                                    image: AppAssets.images.jpegs.noAds.path,
                                    title: addsFreeEn,
                                    subtitle: enjoyWithoutAdsEn,
                                  ),
                                  _PremiumInfoWidget(
                                    image: AppAssets.images.jpegs.offline.path,
                                    title: downloadForOfflineLearning,
                                    subtitle: downloadLessonsEn,
                                  ),
                                  _PremiumInfoWidget(
                                    image: AppAssets
                                        .images.jpegs.interactiveQuiz.path,
                                    title: interactiveQuizesEn,
                                    subtitle: getAccessToPremiumQuizEn,
                                  ),
                                  _PremiumInfoWidget(
                                    image: AppAssets.images.jpegs.lips.path,
                                    title: pronunciationAndSpeakingPracticeEn,
                                    subtitle:
                                        receiveExclusivePronunciationGuidesEn,
                                  ),
                                  _PremiumInfoWidget(
                                    image: AppAssets.images.jpegs.drums.path,
                                    title: culturalContentEn,
                                    subtitle: exploreYorubaProverbsEn,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    cancelAnytimeEn,
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      fontFamily: FontFamily.margarine,
                                    ),
                                  ),
                                  const SizedBox(height: 36),
                                  Button(
                                    label: 'View Plans',
                                    width: mqr.width * 0.79,
                                    onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Padding(
                                        padding: EdgeInsets.only(
                                          bottom: context.btmPadding,
                                        ),
                                        child: const _PaymentPlanModal(),
                                      ),
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.btmPadding),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class _PaymentPlanModal extends HookWidget {
  const _PaymentPlanModal();

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final planType = useState('yearly');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Iconsax.close_circle),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            paymentPlansEn,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            choosePreferredPaymentPlanEn,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 32),
          _PaymentPlanWidget(
            isPlanSelected: planType.value == 'monthly',
            planName: 'Monthly',
            planDesc: 'Charged monthly, cancel anytime',
            onTap: () => planType.value = 'monthly',
          ),
          _PaymentPlanWidget(
            isPlanSelected: planType.value == 'yearly',
            isDisplaySavingsTag: true,
            planName: 'Yearly',
            planDesc: 'Save money',
            onTap: () => planType.value = 'yearly',
          ),
          const SizedBox(height: 35),
          Button(
            label: makePaymentEn,
            width: mqr.width * 0.8,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _PaymentPlanWidget extends StatelessWidget {
  const _PaymentPlanWidget({
    this.isPlanSelected = false,
    this.isDisplaySavingsTag = false,
    required this.planName,
    required this.planDesc,
    this.onTap,
  });

  final bool isPlanSelected, isDisplaySavingsTag;
  final String planName, planDesc;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 24),
        decoration: BoxDecoration(
          color: isPlanSelected ? AppColors.blueE7 : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isPlanSelected ? AppColors.blue12 : AppColors.greyB6,
            width: isPlanSelected ? 1 : 0.8,
          ),
        ),
        child: Row(
          children: [
            CheckBoxIndicator(isSelected: isPlanSelected),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        planName,
                        style: context.textTheme.bodyMedium,
                      ),
                      RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            const TextSpan(
                              text: r'$30',
                            ),
                            TextSpan(
                              text: ' /y',
                              style: context.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColors.black15.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        planDesc,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 11.5.sp,
                          color: AppColors.black15,
                        ),
                      ),
                      if (isDisplaySavingsTag)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blue12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Save 10%',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PremiumInfoWidget extends StatelessWidget {
  const _PremiumInfoWidget({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 35.w,
              height: 35.w,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    textAlign: TextAlign.left,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
