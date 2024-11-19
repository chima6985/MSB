import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LeaderBoard extends HookWidget {
  const LeaderBoard({
    super.key,
    this.currentPosition,
  });

  final ValueNotifier<int>? currentPosition;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final horizScrollContorller =
        useScrollController(initialScrollOffset: 38.w);
    final isShowEmptyState = useState(false);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.topPadding),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    Text(
                      leaderboardYr,
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
              SizedBox(height: 50.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: horizScrollContorller,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    AppAssets.images.svgs.diamondShape.svg(
                      width: 56.w,
                      height: 56.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.cyan32,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppAssets.images.svgs.diamondShape.svg(
                      width: 56.w,
                      height: 56.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.mint00,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppAssets.images.svgs.diamondShape.svg(
                      width: 56.w,
                      height: 56.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.purpleAF,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppAssets.images.svgs.diamondShape.svg(
                      width: 75.w,
                      height: 75.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.goldFC,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const _PadlockedLeagueWidget(),
                    const _PadlockedLeagueWidget(),
                    const _PadlockedLeagueWidget(),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Topaz League',
                textScaler: TextScaler.noScaling,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                ),
              ),
              if (!isShowEmptyState.value) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        top10Advance,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.blackB6,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.5.sp,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Iconsax.clock,
                        size: 16.sp,
                        color: AppColors.goldFC,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '4 days left',
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.5.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ],
          ),
          SizedBox(height: 12.h),
          Divider(
            color: AppColors.blackB6.withOpacity(0.2),
            thickness: 2,
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: isShowEmptyState.value
                ? _EmptyLeaderboardWidget(currentPosition: currentPosition)
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        _LeaderbordPlayerWidget(
                          isElevated: true,
                          no: 1,
                          isShowEmptyState: isShowEmptyState,
                        ),
                        const _LeaderbordPlayerWidget(no: 2),
                        const _LeaderbordPlayerWidget(no: 3),
                        const _LeaderbordPlayerWidget(
                          no: 4,
                          bgColor: AppColors.lemonF9,
                          borderColor: AppColors.lemonC3,
                        ),
                        const _LeaderbordPlayerWidget(
                          no: 5,
                          bgColor: AppColors.lemonF9,
                          borderColor: AppColors.lemonC3,
                        ),
                        const _LeaderbordPlayerWidget(
                          no: 6,
                          bgColor: AppColors.lemonF9,
                          borderColor: AppColors.lemonC3,
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: mqr.height * 0.2 + context.btmPadding),
        ],
      ),
    );
  }
}

class _LeaderbordPlayerWidget extends StatelessWidget {
  const _LeaderbordPlayerWidget({
    this.isElevated = false,
    required this.no,
    this.bgColor = AppColors.greenE7,
    this.borderColor = AppColors.green62,
    this.isShowEmptyState,
  });

  final bool isElevated;
  final int no;
  final Color bgColor;
  final Color borderColor;
  final ValueNotifier<bool>? isShowEmptyState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isShowEmptyState?.value = true,
      child: Material(
        elevation: isElevated ? 20 : 0,
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(12),
        shadowColor: AppColors.black.withOpacity(0.4),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 15, 16, 15),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: !isElevated
                ? Border.all(
                    width: 0.4,
                    color: borderColor,
                  )
                : null,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: borderColor,
                child: Text(
                  no.toString(),
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 12.5.sp,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vassilisa Vasslissa',
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'vassilisa_plays',
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80.w,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppAssets.images.jpegs.coin2.image(
                        width: 24.w,
                        height: 24.w,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '200',
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PadlockedLeagueWidget extends StatelessWidget {
  const _PadlockedLeagueWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.w,
      margin: const EdgeInsets.only(right: 8),
      decoration: const BoxDecoration(
        color: AppColors.greyE8,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(6, 10),
              child: AppAssets.images.svgs.diamondShape.svg(),
            ),
          ),
          const Icon(
            Iconsax.lock5,
            color: AppColors.grey99,
          ),
        ],
      ),
    );
  }
}

class _EmptyLeaderboardWidget extends StatelessWidget {
  const _EmptyLeaderboardWidget({
    this.currentPosition,
  });

  final ValueNotifier<int>? currentPosition;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text(
          completeLessonToJoinWeekDashboardYr,
          textScaler: TextScaler.noScaling,
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(height: 30.h),
        Button(
          label: startALessonEn,
          width: mqr.width * 0.38,
          onPressed: () => currentPosition?.value = 1,
        ),
      ],
    );
  }
}
